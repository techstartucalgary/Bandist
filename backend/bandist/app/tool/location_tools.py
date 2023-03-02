import math
import requests

def latlong_radius(user_latlong:list, radius:float)->"list[float]":
    """
    user_latlong: [latitude, longitude]
                    (N)         (W)
    radius: (km)
    
    returns: [padN , padW]
             (Lat)   (long)
    """
    
    padN=math.asin(radius/6371)*180/math.pi
    padW=math.atan(radius/(6371*math.cos(user_latlong[0])))*180/math.pi

    return padN,padW



def get_user_location():
    IP_info=requests.get("https://ipgeolocation.abstractapi.com/v1/?api_key=fc4cc6d294a44aca8989a2d3ead32f22").json()
    # print(IP_info["latitude"])
    return [IP_info["latitude"],IP_info["longitude"]]