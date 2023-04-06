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
    # favorite_artists = models.TextField(blank=True, null=True)

    def __str__(self) -> str:
        return self.display_name 
class Artist(models.Model):
    name = models.CharField(max_length = 180)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='artist', default=1)
    def __str__(self):
        return str(self.name)
    
class Concert(models.Model):
    name = models.CharField(max_length=180)
    artist = models.ForeignKey(User, on_delete=models.CASCADE, related_name='concert', default=1)

    def __str__(self):
        return str(self.name)
    