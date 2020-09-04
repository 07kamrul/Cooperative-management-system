from django.contrib import admin

# Register your models here.

from .models import *

admin.site.register(Profile)

admin.site.register(Member)
admin.site.register(Amount)
admin.site.register(Deposite)