import 'package:Conalep360/PreferencesClass.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'TypeUserScreen.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  String child; //Para saber a que direccion apuntar dentro de la base de datos
  String correo; //Para saber el correo guardado en el dispositivo

  DatabaseReference _database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    _getLogin(Preferences());
  }

  //Metodo para dirigirse a la ventana de Home
  void _navigationToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()
        )
    );
  }

  //Metodo para navegar al Screen de Typer User
  void _navigationToTypeUser(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder:  (BuildContext context) => TypeUserScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          child: Image.asset('assets/images/logo_app.png', width: 200,height: 200),
        ),
      ),
    );
  }


  //-------------------------
  //Se encarga de verificar el login del usuario
  //----------------
  _getLogin(Preferences _pref) async{

    if (await _pref.getType() == null) {
      _navigationToTypeUser();
    }else{
      child = "Registro_" + await _pref.getType();
      correo = await _pref.getCorreo();

      DataSnapshot data =  await _database.child(child).orderByChild("correo").equalTo(correo).once();
      if(data != null)
        _navigationToHome();
      else
        _navigationToTypeUser();

    }
  }

}

