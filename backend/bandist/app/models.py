# from django.db import models

# class User(models.Model):
#     spotify_id = models.CharField(max_length=255, unique=True)
#     display_name = models.CharField(max_length=255)
#     # city = models.CharField(max_length=255)
#     # access_token = models.CharField(max_length=255)
#     # refresh_token = models.CharField(max_length=255)

#     class Meta:
#         app_label = 'app'

from django.db import models

class User(models.Model):
    spotify_id = models.CharField(max_length=255, unique=True)
    display_name = models.CharField(max_length=255)
    city = models.CharField(max_length=50, blank=True, null=True)
    access_token = models.CharField(max_length=255)
    refresh_token = models.CharField(max_length=255)
    favorite_artists = models.TextField(blank=True, null=True)

    class Meta:
        app_label = 'app'