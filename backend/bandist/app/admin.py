from django.contrib import admin
from .models import User, Artist, Concert

admin.site.register(User)
admin.site.register(Artist)
admin.site.register(Concert)

