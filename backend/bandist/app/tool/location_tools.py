"""
    A module to handle location math with latitude and longitude
    """
import math
import requests


def latlong_square(user_latlong:list,point_2:list, radius:float)->bool:
    """
    user_latlong: [latitude, longitude]
                    (N)         (W)
    radius: (km)
    
    returns:  boolean True if [point_2] is within the approximate [radius] from [user_latlong]

    """
    
    padN=math.asin(radius/6371)*180/math.pi
    padW=math.atan(radius/(6371*math.cos(user_latlong[0])))*180/math.pi

    if abs(user_latlong[0]-point_2[0])<padN and\
       abs(user_latlong[1]-point_2[1])<padW:
        return True

    return False


def lat_long_distance(LL1:"list|dict",LL2:"list|dict")-> float:
    """
    LL1,LL2: [latitude, longitude]
            (N)         (W)
    OR
    dict like: LL1 = {"lat": 1, "lon": 2} 
    
    returns: distance between Lat Long points in km"""
    

    if type(LL1)== dict:
        lat1=LL1["lat"]
        lon1=LL1["lon"]
    else: lat1,lon1=LL1
    if type(LL2)== dict:
        lat2=LL2["lat"]
        lon2=LL2["lon"]
    else: lat2,lon2=LL2

    return math.acos(  math.sin(math.radians(lat1))*\
                math.sin(math.radians(lat2))+\
                math.cos(math.radians(lat1))*\
                math.cos(math.radians(lat2))*\
                math.cos(math.radians(lon2-lon1)))*6371



def get_user_location():
    """
    Sends an API call to get location based on the user's IP address
    """
    IP_info=requests.get("https://ipgeolocation.abstractapi.com/v1/?api_key=fc4cc6d294a44aca8989a2d3ead32f22").json()
    # print(IP_info["latitude"])
    return [IP_info["latitude"],IP_info["longitude"]]