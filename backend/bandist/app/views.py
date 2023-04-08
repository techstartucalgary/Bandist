


import spotipy
from spotipy.oauth2 import SpotifyOAuth
from django.shortcuts import render, redirect
from .models import User, Artist, Concert
from django.conf import settings
# from django.contrib.auth.models import User, Artist
from rest_framework import viewsets, mixins, generics, status
from .serializers import ArtistSerializer, ConcertSerializer, UserSerializer
from rest_framework.response import Response
from rest_framework.views import APIView




import requests
import json

class UserAV(APIView):
    def get(self, request):
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)
    
    def post(self, request): 
        serializer = UserSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)
        
class ArtistAV(APIView):
    def get(self, request):
        artists = Artist.objects.all()
        serializer = ArtistSerializer(artists, many=True)
        return Response(serializer.data)
    
    def post(self, request): 
        serializer = ArtistSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)
        
class ArtistDetailAV(APIView):
    def get(self, request, pk):
        try:
            artist = Artist.objects.get(artist_id = pk)
        except Artist.DoesNotExist:
            return Response({'Error': 'Movie not found'}, status=status.HTTP_404_NOT_FOUND)
        serializer = ArtistSerializer(artist) 
        return Response(serializer.data)
    
    def put(self, request, pk):
        movie = Artist.objects.get(pk = pk)
        serializer = ArtistSerializer(movie, data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
    def delete(self, request, pk):
        movie = Artist.objects.get(pk=pk)
        movie.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
        
class ConcertAV(APIView):
    def get(self, request):
        concerts = Concert.objects.all()
        serializer = ConcertSerializer(concerts, many=True)
        return Response(serializer.data)
    
    def post(self, request): 
        serializer = ConcertSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)

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
    access_token = token_info['access_token']
    refresh_token = token_info['refresh_token']
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
        # user.favorite_artists = favorite_artists
        user.save()
    except User.DoesNotExist:
        user = User.objects.create(
            spotify_id=spotify_id,
            display_name=display_name,
            city=city,
            # favorite_artists=favorite_artists,
            access_token=access_token,
            refresh_token=refresh_token,
        )
    # serializer = UserSerializer(user, many=True)
    request.session['user_id'] = spotify_id

    # return Response(serializer.data)
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
        print(artist_name)
        events = get_upcoming_events(artist_name)
        concerts.extend(events['events'])
        try:
            artist = Artist.objects.get(artist_id=artist_id)
            artist.name = artist_name
            artist.save()
        except Artist.DoesNotExist:
            artist = Artist.objects.create(
            artist_id=artist_id,
            name = artist_name,
            user=user
        )
        for concert in concerts:

            concert_name=concert['short_title']
            concert_id=concert['id']
            concert_date=concert['datetime_utc']
            venue=concert['venue']
            venue_id = venue['id']
            venue_name=venue['name_v2']
            venue_location=venue['location']

            if artist_name==concert['performers'][0]['name']:
                print('WORKEEED')
                try:
                    concert = Concert.objects.get(concert_id=concert_id)
                    concert.name = concert_name
                    concert.date_time=concert_date
                    concert.save()
                except Concert.DoesNotExist:
                    concert = Concert.objects.create(
                    concert_id=concert_id,
                    name = concert_name,
                    referring_artist=artist
                )


    for artist in followed_artists['artists']['items']:
        artist_id = artist['id']
        artist_name = artist['name']
        
        events = get_upcoming_events(artist_name)
        concerts.extend(events['events'])
        try:
            artist = Artist.objects.get(artist_id=artist_id)
            artist.name = artist_name
            artist.save()
        except Artist.DoesNotExist:
            artist = Artist.objects.create(
            artist_id=artist_id,
            name = artist_name,
            user=user
        )

        # for concert in concerts:
        #     print(concert['performers'][0]['name'])

        #     concert_name=concert['short_title']
        #     concert_id=concert['id']
        #     concert_date=concert['datetime_utc']
        #     venue=concert['venue']
        #     venue_id = venue['id']
        #     venue_name=venue['name_v2']
        #     venue_location=venue['location']

        #     if artist_name==concert['performers'][0]['name']:
        #         print('WORKEEED')
        #         try:
        #             concert = Concert.objects.get(concert_id=concert_id)
        #             concert.name = concert_name
        #             concert.date_time=concert_date
        #             concert.save()
        #         except Concert.DoesNotExist:
        #             concert = Concert.objects.create(
        #             concert_id=concert_id,
        #             name = concert_name,
        #             referring_artist=artist
        #         )
     

    
    return render(request, 'dashboard.html', {
        'top_artists': followed_artists['artists']['items'],
        'concerts': concerts,
    })

def home(request):
    return render(request, 'home.html')