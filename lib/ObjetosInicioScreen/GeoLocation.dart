import 'package:Conalep360/GoogleMapScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sms/sms.dart';

class GeoLocation extends StatelessWidget{

  Geolocator _geolocator;
  Position position;


  @override
  void initState() {
    _geolocator = Geolocator();
    checkPermission();
  }

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
  }


  @override
  Widget build(BuildContext context) {

  }



}