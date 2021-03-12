import 'package:Conalep360/ConAlert/ContactScreen.dart';
import 'package:Conalep360/ConAlert/Contacto.dart';
import 'package:Conalep360/ConAlert/MenuButtonFloating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_menu/floating_menu_callback.dart';
import 'package:flutter_floating_menu/floating_menu_item.dart';
import 'package:geolocator/geolocator.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:sms/sms.dart';

import 'ConAlert/DatabaseConalert.dart';
import 'ObjetosInicioScreen/PagerCarreras.dart';
import 'ObjetosInicioScreen/TextoMessenger.dart';
import 'ObjetosInicioScreen/TextoTelefono.dart';
import 'ObjetosInicioScreen/TextoUbicacion.dart';

class InicioScreen extends StatelessWidget implements FloatingMenuCallback {

  // here we have a list of Floating menu items
  final List<FloatingMenuItem> floatMenuList = [
    FloatingMenuItem(id: 2, icon: "assets/iconos_conalert/add_contact.png", backgroundColor: Colors.blueAccent,),
    FloatingMenuItem(id: 1, icon: "assets/iconos_tutorial/ic_alerta.png", backgroundColor: Colors.red),
  ];

  BuildContext contexto;
  String locate;

  @override
  Widget build(BuildContext context) {
    contexto = context;

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
      floatingActionButton: MenuButtonFloating(
        menuList: floatMenuList,
        callback:this,
        btnBackgroundColor: Colors.red,
      ),

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

  _showMaterialDialog() {
    showDialog(
        context: contexto,
        builder: (_) => new AlertDialog(
          title: new Text("ConAlert",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
          content: new Text("¡Ayuda! puedo encontrarme en un situacion de riesgo"
                        +", por favor comunicate  conmigo de inmediato."),
          actions: <Widget>[
            FloatingActionButton(onPressed: (){
              _sendSms();
            },
            child: Image.asset('assets/iconos_tutorial/ic_alerta.png',height: 30,),
              backgroundColor: Colors.red,
            ),

          ],
        ));
  }

  @override
  void onMenuClick(FloatingMenuItem floatingMenuItem) {
    switch (floatingMenuItem.id) {
      case 1:{
        _getPermissions();
      }
        break;
      case 2:{
        Navigator.of(contexto).push(MaterialPageRoute(builder: (context) => ContactScreen(),));
      }
        break;

    }
  }

  _getPermissions() async{
    var _statusLocation = await Permission.location;

    if(await _statusLocation.isGranted){
      _getCurrentPosition();
      _showMaterialDialog();
    }else{
      await _statusLocation.request();
    }
  }

  _getCurrentPosition() async{
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var latitude = await position.latitude;
    var longitude = await position.longitude;


    locate = await latitude.toString() + "," + longitude.toString();

  }
  //
  _sendSms() async{

    var _db = DatabaseConalert();
    await _db.initDB();

    List<Contacto> contacts = await _db.getContactos();
    if(contacts.isEmpty){
      showDialog(
          context: contexto,
          builder: (_) => new AlertDialog(
            title: new Text("ConAlert",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            content: new Text("No existen contactos agregados"),
          ));

    }else{
      int i = 0;
      for(Contacto contacto in contacts){
        i++;
        SmsSender sender = new SmsSender();
        String address = contacto.phone;

        String msg = "";
        if(locate.isEmpty){
          msg = "¡Ayuda! puedo encontrarme en un situacion de riesgo"
              +", por favor comunicate  conmigo.";
        }else{
          msg = "¡Ayuda! puedo encontrarme en un situacion de riesgo"
              +", por favor comunicate  conmigo." + '\n' +
              'maps.google.com/?q=${locate}';
        }

        SmsMessage message = new SmsMessage(address, msg);
        sender.sendSms(message);


        print(i+1);
        print(contacts.length);

        if(++i == contacts.length){
          showDialog(
              context: contexto,
              builder: (_) => new AlertDialog(
                title: new Text("ConAlert",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                content: new Text("Alertas enviadas con exito"),
              ));
        }

      }


    }
  }
}
