+++
date = "2017-02-18T07:43:00+00:00"
categories = ["programming"]
tags = ["django"]
title = "ModelAdmin for a custom Django User model"
subtitle = "Automatically generate a section for extra fields"
+++

Django offers a customized User model. One of the preferred approaches to a custom User is to extend `AbstractUser`. When doing this there is a nice trick to get all the fields you add to `AbstractUser` in a separate section in the admin interface.

The method is to scan the parent for known fields, and add the fields that do not exist in the parent to a separate section. A full example is in the code below.

This would also work if you replaced `AbstractUser` with `AbstractBaseUser` (an even simpler base class).

This ModelAdmin will add your extra fields to the bottom of the page:

{{< highlight python >}}

from __future__ import unicode_literals

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _

from .models import User


class UserAdminWithExtraFields(UserAdmin):

    def __init__(self, *args, **kwargs):
        super(UserAdminWithExtraFields, self).__init__(*args, **kwargs)

        abstract_fields = [field.name for field in AbstractUser._meta.fields]
        user_fields = [field.name for field in self.model._meta.fields]

        self.fieldsets += (
            (_('Extra fields'), {
                'fields': [
                    f for f in user_fields if (
                        f not in abstract_fields and
                        f != self.model._meta.pk.name
                    )
                ],
            }),
        )


admin.site.register(User, UserAdminWithExtraFields)

{{< /highlight >}}

*This is an update of a Tumblr post I wrote on May 8, 2013 (3:14 PM).*

