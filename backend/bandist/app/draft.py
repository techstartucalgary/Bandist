import requests

url = "https://forteweb-airportguide-airport-basic-info-v1.p.rapidapi.com/airports_nearby"

querystring = {"auth":"authairport567","lat":"33.942495","lng":"-118.408068","miles":"5"}

headers = {
	"content-type": "application/octet-stream",
	"X-RapidAPI-Key": "22a5512ce3msh7aae09b6e2e9fb9p163f30jsn4ca1aff5cb64",
	"X-RapidAPI-Host": "forteweb-airportguide-airport-basic-info-v1.p.rapidapi.com"
}

response = requests.get(url, headers=headers, params=querystring)

print(response.json())