// ignore_for_file: use_build_context_synchronously, duplicate_ignore, file_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/widgets/profile_menu.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  String? _currentAddress;
  Position? _currentPosition;
  bool _locationEnabled = false;

  void _toggleLocationEnabled(bool value) {
    setState(() {
      _locationEnabled = value;
    });
    if (!_locationEnabled) {
      setState(() {
        _currentAddress = "";
      });
      setState(() {
        _currentPosition = null;
      });
    }
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kBackgroundColor, kPrimaryColor],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        title: const Text(
          'Privacy',
          style: TextStyle(
            color: kTextColor,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryColor, kBackgroundColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: SwitchListTile(
                    title: const Text('Location'),
                    value: _locationEnabled,
                    onChanged: _toggleLocationEnabled,
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 3,
                  child: ListTile(
                    // leading: Text("Location"),
                    title: Text(
                      _locationEnabled
                          ? _currentAddress ?? "Disabled"
                          : "Disabled",
                      style: const TextStyle(
                        color: kTextColor,
                      ),
                    ),
                    subtitle: Text(
                      _locationEnabled
                          ? 'LAT: ${_currentPosition?.latitude ?? ""} LNG: ${_currentPosition?.longitude ?? ""}'
                          : "",
                      style: const TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _getCurrentPosition();
                      },
                      icon: Icon(_locationEnabled
                          ? Icons.location_on
                          : Icons.location_off),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
