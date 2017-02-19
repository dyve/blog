+++
date = "2010-06-24T07:44:00+00:00"
draft = true
tags = ["JustMigrate", "google maps", "javascript"]
title = "Checking to see if a point is inside a polygon in Google Maps API v3"
+++
<p>Checking whether or not a point is inside a polygon. This assumes you&rsquo;ve enabled the previously posted google.maps.Polygon.getBounds().</p>

<div class="CodeRay">
  <div class="code"><pre><span class="keyword">if</span> (!google.maps.Polygon.prototype.contains) {
        google.maps.Polygon.prototype.<span class="function">contains</span> = <span class="keyword">function</span>(latLng) {

            <span class="comment">// Outside the bounds means outside the polygon</span>
            <span class="keyword">if</span> (!<span class="local-variable">this</span>.getBounds().contains(latLng)) {
                <span class="keyword">return</span> <span class="predefined-constant">false</span>;
            }

            <span class="keyword">var</span> lat = latLng.lat();
            <span class="keyword">var</span> lng = latLng.lng();
            <span class="keyword">var</span> paths = <span class="local-variable">this</span>.getPaths();
            <span class="keyword">var</span> path, pathLength, inPath, i, j, vertex1, vertex2;

            <span class="comment">// Walk all the paths</span>
            <span class="keyword">for</span> (<span class="keyword">var</span> p = <span class="integer">0</span>; p &lt; paths.getLength(); p++) {

                path = paths.getAt(p);
                pathLength = path.getLength();
                j = pathLength - <span class="integer">1</span>;
                inPath = <span class="predefined-constant">false</span>;

                <span class="keyword">for</span> (i = <span class="integer">0</span>; i &lt; pathLength; i++) {

                    vertex1 = path.getAt(i);
                    vertex2 = path.getAt(j);

                    <span class="keyword">if</span> (vertex1.lng() &lt; lng &amp;&amp; vertex2.lng() &gt;= lng || vertex2.lng() &lt; lng &amp;&amp; vertex1.lng() &gt;= lng) {
                        <span class="keyword">if</span> (vertex1.lat() + (lng - vertex1.lng()) / (vertex2.lng() - vertex1.lng()) * (vertex2.lat() - vertex1.lat()) &lt; lat) {
                            inPath = !inPath;
                        }
                    }

                    j = i;

                }

                <span class="keyword">if</span> (inPath) {
                    <span class="keyword">return</span> <span class="predefined-constant">true</span>;
                }

            }

            <span class="keyword">return</span> <span class="predefined-constant">false</span>;
        }
    }</pre></div>
</div>