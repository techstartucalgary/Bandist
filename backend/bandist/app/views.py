import spotipy
from spotipy.oauth2 import SpotifyOAuth
from django.shortcuts import render, redirect
from .models import User
from django.conf import settings

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


def dashboard(request):
    user_id = request.session['user_id']
    user = User.objects.get(spotify_id=user_id)
    access_token = user.access_token
    sp = spotipy.Spotify(auth=access_token)
    # Get the user's top artists
    top_artists = sp.current_user_top_artists(limit=50, time_range='short_term')
    # Get the user's followed artists
    followed_artists = sp.current_user_followed_artists(limit=50)
    # Get the upcoming concerts for the user's top artists in their city
    city = user.city
    concerts = []
    for artist in top_artists['items']:
        artist_id = artist['id']
        # Get the artist's top tracks
        top_tracks = sp.artist_top_tracks(artist_id)
        track_ids = [track['id'] for track in top_tracks['tracks']]
        # Search for events featuring the artist's top tracks
        # events = sp.events(track_ids=track_ids)
        # for event in events['events']:
            # if event['venue']['city'] == city:
                # concerts.append(event)
    return render(request, 'dashboard.html', {
        'display_name': user.display_name,
        'top_artists': top_artists['items'],
        'followed_artists' : followed_artists,
    })




