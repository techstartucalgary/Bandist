from rest_framework import serializers
from .models import Artist, Concert, User, Venue

# class UserSerializer(serializers.ModelSerializer):
#     artist = ArtistSerializer(many=True, read_only = True)
#     class Meta:
#         model = User
#         fields = "__all__"

class ConcertSerializer(serializers.ModelSerializer):
    # user = UserSerializer(many=True, read_only = True)

    class Meta:
        model = Concert
        fields = "__all__"
    

class ArtistSerializer(serializers.ModelSerializer):
    concert = ConcertSerializer(many=True, read_only = True)

    class Meta:
        model = Artist
        fields = "__all__"

class VenueSerializer(serializers.ModelSerializer):
    concert = ConcertSerializer(many=True, read_only = True)

    class Meta:
        model = Venue
        fields = "__all__"
class UserSerializer(serializers.ModelSerializer):
    top_artists = ArtistSerializer(many=True, read_only = True)
    class Meta:
        model = User
        fields = "__all__"