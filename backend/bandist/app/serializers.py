from rest_framework import serializers
from .models import Artist, Concert, User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"

class ConcertSerializer(serializers.ModelSerializer):
    user = UserSerializer(many=True, read_only = True)

    class Meta:
        model = Concert
        fields = "__all__"
    

class ArtistSerializer(serializers.ModelSerializer):
    concert = ConcertSerializer(many=True, read_only = True)

    class Meta:
        model = Artist
        fields = "__all__"