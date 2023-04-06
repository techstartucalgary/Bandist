from django.contrib import admin
from .models import User, Artist, Concert, Venue

admin.site.register(User)
admin.site.register(Artist)
admin.site.register(Concert)
admin.site.register(Venue)


