import spotipy
from spotipy.oauth2 import SpotifyOAuth
from django.shortcuts import render, redirect
from .models import User
from django.conf import settings
import time

TOKEN_INFO = "token_info"

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

    try:
        user = User.objects.get(spotify_id=user['id'])
        user.save()
    except User.DoesNotExist:
        # Create a new User object
        user = User.objects.create(
            spotify_id=user['id'],
            display_name=user['display_name'],
        )
    top_artists = sp.current_user_top_artists(limit=50, time_range='short_term')
    follow_artists = sp.current_user_followed_artists(limit=20, after=None)
    print(follow_artists['artists']['items'][0]['id'])
    print(follow_artists['artists']['items'][0]['name'])
    # artist = sp.artist()
    # print(top_artists['items'][0])
    # for artist in top_artists['items']:
    #     artist_id = artist['id']
    #     # Get the artist's top tracks
    #     top_tracks = sp.artist_top_tracks(artist_id)
    #     track_ids = [track['id'] for track in top_tracks['tracks']]
    #     # Search for events featuring the artist's top tracks
    #     # events = sp.events(track_ids=track_ids)
    #     # for event in events['events']:
    #         # if event['venue']['city'] == city:
    #             # concerts.append(event) 
    return render(request, 'dashboard.html', {
        'display_name': user.display_name,
        'top_artists': top_artists['items'],
    })

# def dashboard(request):
#     user_id = request.session['user_id']
#     user = User.objects.get(spotify_id=user_id)
#     access_token = user.access_token
#     sp = spotipy.Spotify(auth=access_token)
#     # Get the user's top artists
#     top_artists = sp.current_user_top_artists(limit=50, time_range='short_term')
#     # Get the user's followed artists
#     followed_artists = sp.current_user_followed_artists(limit=50)
#     # Get the upcoming concerts for the user's top artists in their city
#     city = user.city
#     concerts = []
#     for artist in top_artists['items']:
#         artist_id = artist['id']
#         # Get the artist's top tracks
#         top_tracks = sp.artist_top_tracks(artist_id)
#         track_ids = [track['id'] for track in top_tracks['tracks']]
#         # Search for events featuring the artist's top tracks
#         # events = sp.events(track_ids=track_ids)
#         # for event in events['events']:
#             # if event['venue']['city'] == city:
#                 # concerts.append(event)
#     return render(request, 'dashboard.html', {
#         'display_name': user.display_name,
#         'top_artists': top_artists['items'],
#         'followed_artists' : followed_artists,
#     })




