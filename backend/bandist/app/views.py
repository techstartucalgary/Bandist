import spotipy
from spotipy.oauth2 import SpotifyOAuth
from django.shortcuts import render, redirect
from .models import User
from django.conf import settings

import requests
import json

def login(request):
    sp_oauth = SpotifyOAuth(
        client_id=settings.SPOTIPY_CLIENT_ID,
        client_secret=settings.SPOTIPY_CLIENT_SECRET,
        redirect_uri=settings.SPOTIPY_REDIRECT_URI,
        scope='user-read-private user-read-email user-library-read user-follow-read user-top-read',
    )
    login_url = sp_oauth.get_authorize_url()
    return redirect(login_url)

def login_callback(request):
    authorization_code = request.GET.get('code')
    sp_oauth = SpotifyOAuth(
        client_id=settings.SPOTIPY_CLIENT_ID,
        client_secret=settings.SPOTIPY_CLIENT_SECRET,
        redirect_uri=settings.SPOTIPY_REDIRECT_URI,
    )
    token_info = sp_oauth.get_access_token(authorization_code)
    access_token = token_info['access_token']
    refresh_token = token_info['refresh_token']
    sp = spotipy.Spotify(auth=access_token)
    user = sp.current_user()
    spotify_id = user['id']
    display_name = user['display_name']
    # Check if the city field is present in the data returned by the Spotify API
    city = user.get('city', '')
    # Check if a User object already exists for this user
    try:
        user = User.objects.get(spotify_id=spotify_id)
        # Update the user's access token
        user.access_token = access_token
        user.save()
    except User.DoesNotExist:
        # Create a new User object
        user = User.objects.create(
            spotify_id=spotify_id,
            display_name=display_name,
            city=city,
            access_token=access_token,
            refresh_token=refresh_token,
        )
    # Store the user's ID in a session or cookie for use in subsequent requests
    request.session['user_id'] = spotify_id
    return redirect('/dashboard')



# SeatGeek implementation. Feel free to edit/remove it as far you wish. - Sakil

def get_upcoming_events(artist_name):
    base_url = 'https://api.seatgeek.com/2/events'
    params = {
        'q': artist_name,
        'client_id': settings.SEATGEEK_CLIENT_ID,
        'per_page': 50
    }
    response = requests.get(base_url, params=params)
    return response.json()


def dashboard(request):
    if 'user_id' not in request.session:
        return redirect('login')
    user_id = request.session['user_id']
    user = User.objects.get(spotify_id=user_id)
    access_token = user.access_token
    sp = spotipy.Spotify(auth=access_token)
    # Getting the top artists
    top_artists = sp.current_user_top_artists(limit=50, time_range='short_term')
    # Seatgeek concerts
    concerts = []
    for artist in top_artists['items']:
        artist_name = artist['name']
        events = get_upcoming_events(artist_name)
        concerts.extend(events['events'])

    return render(request, 'dashboard.html', {
        'top_artists': top_artists['items'],
        'concerts': concerts,
    })

def home(request):
    return render(request, 'base.html')
