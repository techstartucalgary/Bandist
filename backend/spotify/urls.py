from django.urls import path
from .views import AuthURL, spotify_callback

urlpatterns = [
    path('get-auth-url', AuthURL.as_view()),
    path('redirect', spotify_callback)
]