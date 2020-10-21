
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Screen();
  }

}

class Screen extends MaterialApp{

  @override
  // TODO: implement home
  Widget get home => new Scaffold(
    body: Stack(
      children: <Widget>[

        GoogleMap(initialCameraPosition: CameraPosition(
          target: LatLng(27.56,5.6),
        )),

      ],
    ),

  );

}


