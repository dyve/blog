+++
date = "2010-09-29T05:32:00+00:00"
draft = true
tags = ["JustMigrate", "homebrew", "postgis", "postgresql"]
title = "Upgrade your Mac to Postgres 9 using homebrew"
+++
<p>In a <a href="http://dyve.posterous.com/install-postgresql-and-postgis-on-mac-os-x">previous post</a> I mentioned how easy it was to install <a href="http://www.postgresql.org/">Postgres</a> and <a href="http://postgis.refractions.net/">PostGIS</a> using <a href="http://github.com/mxcl/homebrew">homebrew</a> (a superb package manager for Mac OS X).</p>

<p>Since <a href="http://www.postgresql.org/about/news.1235">Postgres 9 is out</a>, let&rsquo;s see how easy it is to upgrade to the newer version.</p>

<p>We will do all of this in a Terminal session.</p>

<h2>Step 1: Upgrade homebrew definitions</h2>

<p>We need to get the newest version of the homebrew formulae.</p>

<div class="CodeRay">
  <div class="code"><pre>brew update</pre></div>
</div>


<h2>Step 2: Install newest versions of PostgreSQL and PostGIS</h2>

<p>Since postgres is part of the postgis package, all we have to do is</p>

<div class="CodeRay">
  <div class="code"><pre>brew install postgis</pre></div>
</div>


<h2>Step 3: Upgrading your databases</h2>

<p>Your databases are still in the old PostgreSQL 8 format. We need to update them, or else the server won&rsquo;t launch.</p>

<div class="CodeRay">
  <div class="code"><pre>mkdir /usr/local/var/postgres9
initdb /usr/local/var/postgres9
pg_upgrade -d /usr/local/var/postgres/ -D /usr/local/var/postgres9/ -b /usr/local/Cellar/postgresql/8.4.4/bin/ -B /usr/local/Cellar/postgresql/9.0.0/bin/ -v
cd /usr/local/var/
mv postgres postgres8
mv postgres9 postgres
rm ~/delete_old_cluster.sh</pre></div>
</div>


<p>The last command (rm ~/delete_old_cluster.sh) removes a dangerous file left by pg_update. It would delete the old data files, but since we moved the new data files to the old location, you definitely do not want to run this.</p>

<h2>Step 4: Test</h2>

<p>Try this command to see if it all works:</p>

<div class="CodeRay">
  <div class="code"><pre>pg_ctl -D /usr/local/var/postgres start</pre></div>
</div>


<p>Use Ctrl-C to stop the server.</p>

<h2>Step 5: Launch the proper version</h2>

<p>We now have to tell your Mac to launch the proper PostgreSQL version. First, we unload the old launch agent. Then we copy the new launch agent to the proper directory, and reload the agent.</p>

<div class="CodeRay">
  <div class="code"><pre>launchctl unload -w ~/Library/LaunchAgents/org.postgresql.postgres.plist
cp /usr/local/Cellar/postgresql/9.0.0/org.postgresql.postgres.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist</pre></div>
</div>


<p>Done! Enjoy your upgraded Postgres and PostGIS!</p>