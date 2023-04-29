# import spotipy
# from spotipy.oauth2 import SpotifyOAuth
# from django.shortcuts import render, redirect
# from .models import User
# from django.conf import settings
# import time
# import requests

# TOKEN_INFO = "token_info"

# def login(request):
#     sp_oauth = SpotifyOAuth(
#         client_id=settings.SPOTIPY_CLIENT_ID,
#         client_secret=settings.SPOTIPY_CLIENT_SECRET,
#         redirect_uri=settings.SPOTIPY_REDIRECT_URI,
#         scope='user-read-private user-read-email user-library-read user-follow-read user-top-read',
#     )
#     login_url = sp_oauth.get_authorize_url()

#     return redirect(login_url)

# def login_callback(request):
#     cache_handler = spotipy.cache_handler.MemoryCacheHandler()

#     authorization_code = request.GET.get('code')
#     sp_oauth = SpotifyOAuth(
#         client_id=settings.SPOTIPY_CLIENT_ID,
#         client_secret=settings.SPOTIPY_CLIENT_SECRET,
#         redirect_uri=settings.SPOTIPY_REDIRECT_URI,
#         cache_handler=cache_handler,
#     )
#     token_info = sp_oauth.get_access_token(authorization_code)
#     request.session.create()

#     request.session[TOKEN_INFO] = token_info
#     return redirect('/getInfo')



# def getInfo(request):
        
#     token_info = request.session.get(TOKEN_INFO, None)
   
#     if not token_info:
#         redirect_uri = settings.SPOTIPY_REDIRECT_URI
#         sp_oauth = SpotifyOAuth(
#             client_id=settings.SPOTIPY_CLIENT_ID,
#             client_secret=settings.SPOTIPY_CLIENT_SECRET,
#             redirect_uri=redirect_uri,
#             scope=["user-library-read","user-top-read"] #here you can specify scopes 
#         )
#         auth_url = sp_oauth.get_authorize_url()
#         return redirect(auth_url)

#     now = int(time.time())
#     is_expired = token_info['expires_at'] - now < 60
#     if is_expired:
#         sp_oauth = SpotifyOAuth(
#             client_id=settings.SPOTIPY_CLIENT_ID,
#             client_secret=settings.SPOTIPY_CLIENT_SECRET,
#             redirect_uri=settings.SPOTIPY_REDIRECT_URI,
#             scope=["user-library-read","user-top-read"]
#         )
#         token_info = sp_oauth.refresh_access_token(token_info['refresh_token'])
#         request.session[TOKEN_INFO] = token_info

#     access_token = token_info['access_token']
#     sp = spotipy.Spotify(auth=access_token)
#     user = sp.current_user()

#     try:
#         user = User.objects.get(spotify_id=user['id'])
#         user.save()
#     except User.DoesNotExist:
#         # Create a new User object
#         user = User.objects.create(
#             spotify_id=user['id'],
#             display_name=user['display_name'],
#         )
#     top_artists = sp.current_user_top_artists(limit=50, time_range='short_term')
#     follow_artists = sp.current_user_followed_artists(limit=20, after=None)
#     print(follow_artists['artists']['items'][0]['id'])
#     print(follow_artists['artists']['items'][0]['name'])

#     my_headers = {'Authorization' : 'Bearer 561|iuTTRdE1SgKGBidlg6fB9YZbWrwkdUVL6bv3Rd1p'}
#     response = requests.get('https://zylalabs.com/api/94/music+gigs+and+concerts+tracker+api/146/get+concerts+by+artist?name=BTS', headers=my_headers)
#     print(response.text)
#     # artist = sp.artist()
#     # print(top_artists['items'][0])
#     # for artist in top_artists['items']:
#     #     artist_id = artist['id']
#     #     # Get the artist's top tracks
#     #     top_tracks = sp.artist_top_tracks(artist_id)
#     #     track_ids = [track['id'] for track in top_tracks['tracks']]
#     #     # Search for events featuring the artist's top tracks
#     #     # events = sp.events(track_ids=track_ids)
#     #     # for event in events['events']:
#     #         # if event['venue']['city'] == city:
#     #             # concerts.append(event) 
#     return render(request, 'dashboard.html', {
#         'display_name': user.display_name,
#         'top_artists': top_artists['items'],
#     })



import spotipy
from spotipy.oauth2 import SpotifyOAuth
from django.shortcuts import render, redirect
from .models import User, Artist, Concert
from django.conf import settings
# from django.contrib.auth.models import User, Artist
from rest_framework import viewsets, mixins, generics
from .serializers import ArtistSerializer, ConcertSerializer, UserSerializer

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

    print(
        'reached here ______________________'
    )
    authorization_code = request.GET.get('code')
    sp_oauth = SpotifyOAuth(
        client_id=settings.SPOTIPY_CLIENT_ID,
        client_secret=settings.SPOTIPY_CLIENT_SECRET,
        redirect_uri=settings.SPOTIPY_REDIRECT_URI,
        cache_handler=cache_handler,
    )
    print(authorization_code)
    token_info = sp_oauth.get_access_token(authorization_code)
    print(token_info)
    access_token = token_info['access_token']
    refresh_token = token_info['refresh_token']
    print(access_token)
    sp = spotipy.Spotify(auth=access_token)
    user = sp.current_user()
    spotify_id = user['id']
    display_name = user['display_name']
    city = user.get('city', '')
    favorite_artists = ','.join([artist['name'] for artist in sp.current_user_top_artists(limit=50, time_range='short_term')['items']])
    try:
        user = User.objects.get(spotify_id=spotify_id)
        user.access_token = access_token
        user.city = city
        user.favorite_artists = favorite_artists
        user.save()
    except User.DoesNotExist:
        user = User.objects.create(
            spotify_id=spotify_id,
            display_name=display_name,
            city=city,
            favorite_artists=favorite_artists,
            access_token=access_token,
            refresh_token=refresh_token,
        )
    request.session['user_id'] = spotify_id
    return redirect('/dashboard')

def logout(request):
    # Clear the user's session data
    request.session.clear()
    
    # Redirect to the home page
    return redirect('home')


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
    print("REACHED HERE_________________")
    user_id = request.session['user_id']
    user = User.objects.get(spotify_id=user_id)
    print(user)
    print(user.display_name)
    access_token = user.access_token
    sp = spotipy.Spotify(auth=access_token)
    # Getting the top artists
    top_artists = sp.current_user_top_artists(limit=50, time_range='short_term')
    followed_artists = sp.current_user_followed_artists(limit=20, after=None)
   
    # Seatgeek concerts
    concerts = []
    for artist in top_artists['items']:
        artist_name = artist['name']
        events = get_upcoming_events(artist_name)
        concerts.extend(events['events'])

    # concerts = []
    # for artist in followed_artists['artists']['items']:
    #     # artist_id = artist['id']
    #     artist_name = artist['name']
    #     events = get_upcoming_events(artist_name)
    #     concerts.extend(events['events'])
    #     try:
    #         user = Artist.objects.get()
    #         user.name = artist_name
    #         user.concerts = concerts
    #         user.save()
    #     except User.DoesNotExist:
    #         user = User.objects.create(
    #         name = artist_name,
    #         concerts = concerts
    #     )

    #     print(artist)

    
    return render(request, 'dashboard.html', {
        'top_artists': followed_artists['artists']['items'],
        'concerts': concerts,
    })

def home(request):
    return render(request, 'home.html')