from django.db import models

class SpotifyToken(models.Model):
    user = models.CharField(max_length=50, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    refresh_token = models.CharField(max_length=150, null=True, blank = True)
    access_token = models.CharField(max_length=150, null=True, blank = True)
    expires_in = models.DateTimeField(null=True, blank = True)
    token_type = models.CharField(max_length=50, null=True, blank = True)
