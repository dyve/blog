+++
date = "2010-06-24T07:35:00+00:00"
draft = true
tags = ["JustMigrate", "google maps", "javascript"]
title = "The boundaries of a polygon in Google Maps API v3"
+++
<p>In the Google Maps API v3, you can no longer get the boundaries of a polygon. Here&rsquo;s a restore for that function (compliant with v3 Google Maps standards):</p>

<div class="CodeRay">
  <div class="code"><pre><span class="keyword">if</span> (!google.maps.Polygon.prototype.getBounds) {
        google.maps.Polygon.prototype.<span class="function">getBounds</span> = <span class="keyword">function</span>(latLng) {
            <span class="keyword">var</span> bounds = <span class="keyword">new</span> google.maps.LatLngBounds();
            <span class="keyword">var</span> paths = <span class="local-variable">this</span>.getPaths();
            <span class="keyword">var</span> path;
            <span class="keyword">for</span> (<span class="keyword">var</span> p = <span class="integer">0</span>; p &lt; paths.getLength(); p++) {
                path = paths.getAt(p);
                <span class="keyword">for</span> (<span class="keyword">var</span> i = <span class="integer">0</span>; i &lt; path.getLength(); i++) {
                    bounds.extend(path.getAt(i));
                }
            }
            <span class="keyword">return</span> bounds;
        }
    }</pre></div>
</div>