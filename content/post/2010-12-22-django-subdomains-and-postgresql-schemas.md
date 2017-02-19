+++
date = "2010-12-22T05:34:00+00:00"
draft = true
tags = ["JustMigrate", "code", "django", "postgresql", "python"]
title = "Django subdomains and PostgreSQL schemas"
+++
<p>Is there an existing solution to make a Django app use a different PostgreSQL schema based for each subdomain?</p>

<p>This is a question I asked on StackOverflow.com a while back. &ldquo;<a href="http://stackoverflow.com/questions/4105329/multiple-postgresql-schemas-and-users-on-django-with-subdomains">Multiple PostgreSQL schemas and users on Django with subdomains</a>&rdquo; got some interesting answers, but not the one I was looking for. I decided to build something myself, even though I&rsquo;ve only been at Django for a short while.</p>

<p>The solution I came up with is a small piece of <a href="http://docs.djangoproject.com/en/dev/topics/http/middleware/">Django middleware</a>, that basically does the following:</p>

<ul>
<li>determine the subdomain</li>
<li>see if we want to ignore the subdomain (e.g. &lsquo;www&rsquo;), based on MAIN_SUBDOMAIN, an array of subdomains to ignore defined in settings.py</li>
<li>if we keep the subdomain, store it in the request</li>
<li>set the <a href="http://www.postgresql.org/docs/9.0/interactive/ddl-schemas.html">search path</a> to the proper schema</li>
</ul>


<p>The code for middleware.py is:</p>

<div class="CodeRay">
  <div class="code"><pre><span class="keyword">from</span> <span class="include">django.db</span> <span class="keyword">import</span> <span class="include">connection</span>

<span class="keyword">class</span> <span class="class">Subdomains</span>:

    <span class="keyword">def</span> <span class="function">process_request</span>(<span class="predefined-constant">self</span>, request):
        <span class="comment"><span class="delimiter">&quot;&quot;&quot;</span><span class="content">Inject subdomain information into request</span><span class="delimiter">&quot;&quot;&quot;</span></span>
        host = request.get_host()
        parts = host.split(<span class="string"><span class="delimiter">'</span><span class="content">.</span><span class="delimiter">'</span></span>)
        <span class="keyword">if</span> <span class="predefined">len</span>(parts) &gt; <span class="integer">2</span>:
            subdomain = <span class="string"><span class="modifier">u</span><span class="delimiter">'</span><span class="content">.</span><span class="delimiter">'</span></span>.join(parts[:-<span class="integer">2</span>])
            <span class="keyword">try</span>:
                <span class="keyword">from</span> <span class="include">django.conf.settings</span> <span class="keyword">import</span> <span class="include">MAIN_SUBDOMAIN</span>
                <span class="keyword">if</span> subdomain <span class="keyword">in</span> MAIN_SUBDOMAIN:
                    subdomain = <span class="predefined-constant">None</span>
            <span class="keyword">except</span> <span class="exception">ImportError</span>:
                <span class="keyword">pass</span>
        <span class="keyword">else</span>:
            subdomain = <span class="predefined-constant">None</span>
        request.subdomain = subdomain
        schema = <span class="string"><span class="delimiter">'</span><span class="content">account_%s</span><span class="delimiter">'</span></span> % subdomain
        cursor = connection.cursor()
        cursor.execute(<span class="string"><span class="delimiter">&quot;</span><span class="content">SET search_path TO %s, public</span><span class="delimiter">&quot;</span></span> % schema)
        <span class="keyword">return</span> <span class="predefined-constant">None</span></pre></div>
</div>


<p>As you can see I&rsquo;m using account_SUBDOMAIN as my schema. You can substitute this to roll your own. The search path is then set to account_SUBDOMAIN, public, meaning that any schemas other than account_SUBDOMAIN and public are ignored.</p>

<p>This means that you have to make sure the account_SUBDOMAIN schema contains all the valid definitions for your models. You may want to have tables that are defined on account_SUBDOMAIN level share sequences (defined in the public schema) to have globally unique primary keys over your database. For now, this is all done manually.</p>

<p>To call the middleware, adjust your settings.py like this (in the example below, I defined the middleware.py module in an app called accounts):</p>

<div class="CodeRay">
  <div class="code"><pre>MIDDLEWARE_CLASSES = (
    <span class="string"><span class="delimiter">'</span><span class="content">accounts.middleware.Subdomains</span><span class="delimiter">'</span></span>,
    <span class="comment"># other middleware</span>
)</pre></div>
</div>


<p>I&rsquo;d be interested to hear opinions and improvements to this piece of Django.</p>