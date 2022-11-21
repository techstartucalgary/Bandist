from django.shortcuts import render, redirect
from .credentials import CLIENT_SECRET, CLIENT_ID, REDIRECT_URI
from rest_framework.views import APIView
from requests import Request, post
from rest_framework import status
from rest_framework.response import Response 
from .util import update_or_create_user_tokens

# This view returns a url that we can go to to authenticate our application

# API endpoint that returns url
class AuthURL(APIView):
    def get(self, request, format=None):
        scopes = 'user-follow-read playlist-read-private user-read-private'
        url = Request('GET', "https://accounts.spotify.com/authorize", params={
            'scope': scopes,
            'response_type': 'code',
            'redirect_uri': REDIRECT_URI,
            'client_id': CLIENT_ID
        }).prepare().url

        return Response({
            'url':url},tatus=status.HTTP_200_OK)

def spotify_callback(request, format=None):
    code = request.GET.get('code')
    error = request.GET.get('error')

    response = post('https://accounts.spotify.com/api/token', data = {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': REDIRECT_URI,
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET
    }).json()

    access_token = response.get('access_token')
    token_type = response.get('token_type')
    refresh_token = response.get('refresh_token')
    expires_in = response.get('expires_in')
    error = response.get('error')
    if not request.session.exists(request.session.session_key):
        request.session.create()
    update_or_create_user_tokens(
        request.session.session_key, access_token, token_type, expires_in, refresh_token
    )
    return redirect('frontend:')
