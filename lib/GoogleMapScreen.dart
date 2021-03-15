
import 'package:Conalep360/ObjetosInicioScreen/TextoTelefono.dart';
import 'package:Conalep360/ObjetosInicioScreen/TextoUbicacion.dart';
import 'package:Conalep360/PreferencesClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String plantel;

String direcBottom;
String phoneBottom;

int index;

LatLng _latLng = LatLng(22.760951, -98.960114);

GoogleMap _googleMap;


class GoogleMapScreen extends StatefulWidget{
  @override
  GoogleMapState createState() => GoogleMapState();
}

class GoogleMapState extends State<GoogleMapScreen>{
  @override
  void initState() {
    _getPosition();
  }

  _getPosition() async{

    Preferences _pref = Preferences();
    plantel = await _pref.getPlantel();

    switch(await plantel){
      case "Mante": setState(() {_latLng = new LatLng(22.760951, -98.960114);}); break;
      case "Matamoros": setState(() {_latLng = new LatLng(25.877220, -97.545964);}); break;
      case "Miguel Aleman": setState(() {_latLng = new LatLng(26.387352, -99.032973);}); break;
      case "Nuevo Laredo": setState(() {_latLng = new LatLng(27.469272, -99.545122);}); break;
      case "Rio Bravo": setState(() {_latLng = new LatLng(25.992387, -98.121372);}); break;
      case "Reynosa": setState(() {_latLng = new LatLng(26.0639271, -98.3124371);}); break;
      case "Tampico":setState(() {_latLng = new LatLng(22.2952895, -97.8570227);}); break;
      case "Victoria": setState(() {_latLng = new LatLng(23.7705326, -99.14869);}); break;
      case "Cast Matamoros": setState(() {_latLng = new LatLng(25.8761, -97.5463577);}); break;
    }

    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
    for(int i = 0;i < 9; i++){
      final MarkerId markerId = MarkerId("conalep" + i.toString());
      LatLng aux;
      switch(i){
        case 0: setState(() {aux = new LatLng(22.760951, -98.960114);}); break;
        case 1: setState(() {aux = new LatLng(25.877220, -97.545964);}); break;
        case 2: setState(() {aux = new LatLng(26.387352, -99.032973);}); break;
        case 3: setState(() {aux = new LatLng(27.469272, -99.545122);}); break;
        case 4: setState(() {aux = new LatLng(25.992387, -98.121372);}); break;
        case 5: setState(() {aux = new LatLng(26.0639271, -98.3124371);}); break;
        case 6:setState(() {aux = new LatLng(22.2952895, -97.8570227);}); break;
        case 7: setState(() {aux = new LatLng(23.7705326, -99.14869);}); break;
        case 8: setState(() {aux = new LatLng(25.8761, -97.5463577);}); break;
      }

      final Marker marker = Marker(
        markerId: markerId,
        position: aux,
      );
      setState(() {
        // adding a new marker to map
        markers[markerId] = marker;
      });


    }

    setState(() {
      _googleMap = GoogleMap(
        markers:Set<Marker>.of(markers.values),
        initialCameraPosition: CameraPosition(target: _latLng,
        zoom: 10),
        minMaxZoomPreference: MinMaxZoomPreference(10,50),);
    });
  }

  @override
  Widget build(BuildContext context) {
    _getPosition();


    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: (_googleMap == null)? Container(child: Text("Cargando..."),): _googleMap,),
          InkWell(
            onTap: ()=>  displayBottomSheet(context),
            child: Container(
              color: Colors.white,
              height: 60,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Icon(Icons.arrow_drop_up),
                  ),

                  // SizedBox(height: 10,),
                  Text("Coledio Nacional De Educacion Profesional Tecnica",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                ],
              ),

            ),
          ),
        ],
      ),

    );
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.28,
            child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Center(
                  child: Icon(Icons.arrow_drop_up),
                ),

                // SizedBox(height: 10,),
                Text("Colegio Nacional De Educacion Profesional Tecnica",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(children: <Widget>[
                  SizedBox(width: 20,),
                  Icon(Icons.star,color: Colors.yellowAccent,),
                  Icon(Icons.star,color: Colors.yellowAccent,),
                  Icon(Icons.star,color: Colors.yellowAccent,),
                  Icon(Icons.star,color: Colors.yellowAccent,),
                  Icon(Icons.star,color: Colors.yellowAccent,),
                  Icon(Icons.star_half,color: Colors.yellowAccent,),
                  SizedBox(width: 15,),
                  Text("5.6 (56)"),
                ],),

                SizedBox(height: 15,),

                Row(children: <Widget>[
                  SizedBox(width: 20,),
                  Icon(Icons.add_location,color: Colors.red,),
                  SizedBox(width: 10,),
                  TextoUbicacion(),
                  // Text("${direcBottom}"),
                ],),

                SizedBox(height: 15,),
                Row(children: <Widget>[
                  SizedBox(width: 23,),
                  Image.asset("assets/iconos_inicio/ic_tel.png",height: 18,),
                  // (Icons.add_location,color: Colors.red,),
                  SizedBox(width: 10,),
                  TextoTelefono(),
                  // Text("${phoneBottom}"),
                ],),

              ],
            ),

          ),
          );
        });
  }

}


