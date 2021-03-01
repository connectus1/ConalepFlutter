import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ObjetosInicioScreen/PagerCarreras.dart';
import 'ObjetosInicioScreen/TextoMessenger.dart';
import 'ObjetosInicioScreen/TextoTelefono.dart';
import 'ObjetosInicioScreen/TextoUbicacion.dart';

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              titulo(),
              SizedBox(
                height: 10,
              ),
              _primerTexto(),
              SizedBox(
                height: 10,
              ),
              subtitulos("Ofrecemos carreras en:"),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 152,
                child: PageCarreras(),
              ),
              SizedBox(
                height: 20,
              ),
              subtitulos("Contactanos"),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Image.asset('assets/iconos_menu/ic_puntero.png',
                        width: 20, height: 20),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: TextoUbicacion(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Image.asset('assets/iconos_inicio/ic_tel.png',
                        width: 20, height: 20),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: TextoTelefono(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Image.asset('assets/iconos_inicio/ic_messenger.png',
                        width: 20, height: 20),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: TextoMessenger(),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              subtitulos("Misión"),
              SizedBox(
                height: 5,
              ),
              textos(
                  "El Colegio Nacional de Educación Profesional Técnica, tiene como Misión, formar mediante un modelo basado en competencias, a Profesionales Técnicos y Profesionales Técnicos Bachiller, capacita y evalúa con fines de certificación de competencias laborales y servicios tecnológicos para atender las necesidades del sector productivo del país."),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrentPosition();

        },
        backgroundColor: Colors.red,
        child: Image.asset(
          'assets/iconos_tutorial/ic_alerta.png',
          height: 40.0,
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                    height: 10,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(27.56, 5.6),
                  ),
                ),
              )),
              Container(

                child: Text("Texto de prueba",style: TextStyle(fontSize: 14),),
              ),

            ],
          ),
        );
        GoogleMap(
            initialCameraPosition: CameraPosition(
          target: LatLng(27.56, 5.6),
        ));

        //
        // return AlertDialog(
        //   content: SingleChildScrollView(
        //     child: ListBody(
        //       children: <Widget>[
        //         GoogleMap(initialCameraPosition: CameraPosition(
        //           target: LatLng(27.56,5.6),
        //         )),
        //         // GoogleMapScreen(),
        //         Text("Probando alert"),
        //       ],
        //     ),
        //   ),
        //   actions: <Widget>[
        //     FloatingActionButton(
        //       onPressed: (){
        //         SmsSender sender = new SmsSender();
        //         String address = '8334289826';
        //
        //         SmsMessage message = new SmsMessage(address, 'Hello flutter!');
        //         sender.sendSms(message);
        //
        //       },
        //       backgroundColor: Colors.red,
        //       child: Image.asset('assets/iconos_tutorial/ic_alerta.png',height: 40.0,),
        //
        //     ),
        //   ],
        // );
      },
    );
  }

//El texto que muestra el titulo
  Container titulo() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.0, 0.0, 0.0),
      alignment: Alignment.topCenter,
      child: Text("Colegio Nacional De Educación Profesional Tecnica",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.green[900]),
          textAlign: TextAlign.center),
    );
  }

  Container _primerTexto() {
    String texto = "El Colegio Nacional de Educación Profesional Técnica es una Institución " +
        "líder en la formación de Profesionales Técnicos y Profesionales Técnicos Bachiller en México, que cursan " +
        "programas reconocidos por su calidad y basados en el modelo mexicano de formación dual, egresan con " +
        "competencias laborales y valores sociales que les permiten ser competitivos en el mercado laboral y " +
        "continuar estudios superiores.";

    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      child: Center(
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 14.0,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Container textos(String texto) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      child: Center(
          child: Text(
        texto,
        style: TextStyle(
          fontSize: 14.0,
        ),
        textAlign: TextAlign.justify,
      )),
    );
  }

  Container subtitulos(String text) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  _getCurrentPosition() async{
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var latitude = position.latitude;
    var longitude = position.longitude;

    print(latitude.toString() + ":" + longitude.toString());

  }

}
