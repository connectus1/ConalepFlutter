import 'package:Conalep360/FirebaseObjects/FirebaseVerification.dart';
import 'package:Conalep360/LoginScreen.dart';
import 'package:Conalep360/PreferencesClass.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';
import 'TypeUserScreen.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();

  SplashScreen({this.app});
  FirebaseApp app;

}

class _SplashScreenState extends State<SplashScreen> {

  final database = FirebaseDatabase.instance;

  String child = "Registro_Visitas";
  int index = 0;
  bool type = false;


  @override
  void initState() {
    super.initState();

  }



  setUrl(int position) {
    switch (position) {
      case 0:
        return 'https://plantelmante.firebaseapp.com/';
      case 1:
        return 'https://plantelmatamoros.firebaseapp.com/';
      case 2:
        return 'https://plantelmiguel.firebaseapp.com/';
      case 3:
        return 'https://plantelnuevolaredo.firebaseapp.com/';
      case 4:
        return 'https://plantelriobravo.firebaseapp.com/';
      case 5:
        return 'https://plantelreynosa.firebaseapp.com/';
      case 6:
        return 'https://planteltampico.firebaseapp.com/';
      case 7:
        return 'https://plantelvictoria.firebaseapp.com/';
      case 8:
        return 'https://castmatamoros.firebaseapp.com/';
    }
  }


  void _navigationToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()
        )
    );
  }

  void _navigationToLogin(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen()
      )
    );
  }

  void _navigationToTypeUser(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder:  (BuildContext context) => TypeUserScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    _getLogin();

    return Scaffold(
      body: Center(
        child:Container(
          child: Image.asset('assets/images/logo_app.png', width: 200,height: 200),
        ),
      ),
    );
  }


  //-------------------------
  //Metodo se encarga de revisar el type del user
  //----------------
  _getLogin() async{
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    SharedPreferences _pref = await SharedPreferences.getInstance();

    bool registro = _pref.getBool("registro") ?? false;
    if(!registro){
      _navigationToTypeUser();
    }else{
      String child ="";

      if(_pref.getBool("user"))
        child = "Registro_Alumnos";
      else
        child = "Registro_Visitas";


      ref.child(child).orderByChild("correo").equalTo(_pref.getString("correo")).once().then((DataSnapshot data){
        if(data.value != null)
          _navigationToHome();
        else
          _navigationToTypeUser();
      });


    }

  }

}

