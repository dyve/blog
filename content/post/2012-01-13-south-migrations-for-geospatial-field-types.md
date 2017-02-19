+++
date = "2012-01-13T06:43:00+00:00"
draft = true
tags = ["JustMigrate", "django", "python", "south"]
title = "South migrations for geospatial field types"
+++
<p>Problem:</p>
<p>When converting a <a href="http://django.org">Django</a> app to <a href="http://south.aeracode.org/docs/">South</a> fails with the message:</p>
<div class="CodeRay">
<div class="code">
<pre>! Cannot freeze field 'FIELD_NAME'
! (this field has class django.contrib.gis.db.models.fields.PointField)

! South cannot introspect some fields; this is probably because they are custom
! fields. If they worked in 0.6 or below, this is because we have removed the
! models parser (it often broke things).
! To fix this, read <a href="http://south.aeracode.org/wiki/MyFieldsDontWork">http://south.aeracode.org/wiki/MyFieldsDontWork</a></pre>
</div>
</div>
<p>Thanks to <a href="http://reinout.vanrees.org/weblog/2011/05/12/django-south-geom-fields.html">Reinout van Rees</a> for figuring this out.</p>
<p>Solution:</p>
<p>In order for South to work, you have to add django.contrib.gis to the INSTALLED_APPS in settings.py.</p>