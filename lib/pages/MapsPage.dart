import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';

// TODO:
// Get current location of the user - DONE
// get location of the concert // TEMPORARY DONE
// pull data from google directions api for ex: http://maps.googleapis.com/maps/api/directions/json?origin=51,0&destination=51.5,-0.1&key=
// create a route between the two using polyline ('flutter_polyline_points' package) using the api data
// display the route on the map and zooom out to show the whole route (implement gotoPlace function)

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key, required this.lat, required this.lon})
      : super(key: key);

  @override
  State<MapsPage> createState() => MapSampleState();

  // intialize variables to state and set them to the paramter values
  final double lat;
  final double lon;
}

class MapSampleState extends State<MapsPage> {
  late Position _currentPosition;
  // late Position _concertLocation; // will implement once data from backend is available
  final CameraPosition _concertLocation = const CameraPosition(
    target: LatLng(37.7677054, -122.3890909),
    zoom: 14.4746,
  );

  Set<Polyline> _polylines = Set<Polyline>();
  int _polylineIdCounter = 1;

  static final API_KEY = "INSERT API KEY HERE";

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    // _getCurrentPosition(); // am I supposed to call this here?
    // _createPolylines();
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        // polylines: _polylines,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lon),
          zoom: 14.4746,
        ),
        // create a marker for the concert location
        markers: {
          Marker(
            markerId: const MarkerId('concert'),
            position: LatLng(widget.lat, widget.lon),
            infoWindow: const InfoWindow(title: 'Concert'),
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheMe() async {
    // await _getCurrentPosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  Future<void> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // ignore: unnecessary_null_comparison
    if (position == null) {
      return Future.error('Location is null');
    }
    setState(() {
      _currentPosition = position;
    });
  }

  Future<Map<String, dynamic>> getDirections() async {
    final String origin =
        "${_currentPosition.latitude.toString()},${_currentPosition.longitude.toString()}";

    final String destination =
        "${_concertLocation.target.latitude.toString()},${_concertLocation.target.latitude.toString()}";

    final String url =
        "http://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$API_KEY";

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var results = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded': PolylinePoints()
          .decodePolyline(json['routes'][0]['overview_polyline']['points']),
    };

    return results;
  }

  void _createPolylines() async {
    var directions = await getDirections();
    _polylineIdCounter++;
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId(_polylineIdCounter.toString()),
        visible: true,
        points: directions['polyline_decoded'].map((e) {
          return LatLng(e.latitude, e.longitude);
        }).toList(),
        width: 2,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      ));
    });
  }
}
