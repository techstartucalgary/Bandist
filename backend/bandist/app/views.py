import spotipy
from spotipy.oauth2 import SpotifyOAuth
from django.shortcuts import render, redirect
from .models import User
from django.conf import settings
import time
from .tool import location_tools as LT

TOKEN_INFO = "token_info"

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
    cache_handler = spotipy.cache_handler.MemoryCacheHandler()

    authorization_code = request.GET.get('code')
    sp_oauth = SpotifyOAuth(
        client_id=settings.SPOTIPY_CLIENT_ID,
        client_secret=settings.SPOTIPY_CLIENT_SECRET,
        redirect_uri=settings.SPOTIPY_REDIRECT_URI,
        cache_handler=cache_handler,
    )
    token_info = sp_oauth.get_access_token(authorization_code)
    request.session.create()

    request.session[TOKEN_INFO] = token_info
    return redirect('/getInfo')



def getInfo(request):
        
    token_info = request.session.get(TOKEN_INFO, None)
   
    if not token_info:
        redirect_uri = settings.SPOTIPY_REDIRECT_URI
        sp_oauth = SpotifyOAuth(
            client_id=settings.SPOTIPY_CLIENT_ID,
            client_secret=settings.SPOTIPY_CLIENT_SECRET,
            redirect_uri=redirect_uri,
            scope=["user-library-read","user-top-read"] #here you can specify scopes 
        )
        auth_url = sp_oauth.get_authorize_url()
        return redirect(auth_url)

    now = int(time.time())
    is_expired = token_info['expires_at'] - now < 60
    if is_expired:
        sp_oauth = SpotifyOAuth(
            client_id=settings.SPOTIPY_CLIENT_ID,
            client_secret=settings.SPOTIPY_CLIENT_SECRET,
            redirect_uri=settings.SPOTIPY_REDIRECT_URI,
            scope=["user-library-read","user-top-read"]
        )
        token_info = sp_oauth.refresh_access_token(token_info['refresh_token'])
        request.session[TOKEN_INFO] = token_info

    access_token = token_info['access_token']
    sp = spotipy.Spotify(auth=access_token)
    user = sp.current_user()
    print(user)
    spotify_id = user['id']
    display_name = user['display_name']
    city = user.get('city', '')
    try:
        user = User.objects.get(spotify_id=spotify_id)
        user.access_token = access_token
        user.save()
    except User.DoesNotExist:
        user = User.objects.create(
            spotify_id=user['id'],
            display_name=user['display_name'],
        )
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

def get_concerts_in_radius(artists:list, radius:float=1000.0)->"list[dict]":
    """
    artists: spitipy artist list
    radius: search radius in km
    
    returns: list of seatgeek concert dicts
    """
    concerts=[]
    userlocation=LT.get_user_location()
    for artist in artists['artists']['items']:
        artist_name = artist['name']
        events = get_upcoming_events(artist_name)
        try:
            for event in events["events"]:
                # print(f"{event['venue']['location']} distance: {LT.lat_long_distance(userlocation,event['venue']['location'])}")
                if LT.lat_long_distance(userlocation,event['venue']['location'])< radius:
                    concerts.append(event)
        except Exception as e:
            print("no location", e)
            pass
    return concerts

def dashboard(request):
    user_id = request.session['user_id']
    user = User.objects.get(spotify_id=user_id)
    access_token = user.access_token
    sp = spotipy.Spotify(auth=access_token)
    # Getting the top artists
    top_artists = sp.current_user_top_artists(limit=50, time_range='short_term')
    followed_artists = sp.current_user_followed_artists(limit=20, after=None) 

    concerts = get_concerts_in_radius(followed_artists,radius = 1000)

    return render(request, 'dashboard.html', {
        # 'top_artists': top_artists['items'],
        'top_artists': followed_artists['artists']['items'],
        'concerts': concerts,
    })

def home(request):
    return render(request, 'home.html')

