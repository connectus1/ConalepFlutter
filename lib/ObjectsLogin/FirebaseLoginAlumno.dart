import 'package:Conalep360/Animation/FadeAnimation.dart';
import 'package:Conalep360/FirebaseObjects/Login/ItemUser.dart';
import 'package:Conalep360/ObjectsRegistro/RegistroAlumnos/RegisterAlumno.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../TutorialScreen.dart';

//-----------------------
//Atributos de la clase
//------------------------
int indexPlantel;

class FirebaseLoginAlumno extends StatelessWidget{
  //----------------------
  //Se declaran los controladores de los editText
  //-------------------------
  TextEditingController correoController = new TextEditingController();
  TextEditingController contraController = new TextEditingController();

  DatabaseReference ref;

  @override
  Widget build(BuildContext context) {
    ref = FirebaseDatabase.instance.reference(); //obtenemos la referencia de la base de datos

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 90,
            child: Stack(
              children: <Widget>[

                //-----------------------------
                //Banner Superior de la Screen
                //---------------------------
                Positioned(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/banner.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          //-----------------------------
          //Logo de la aplicacion
          //---------------------------
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_app.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
            ),
          ),


          //-----------------------------
          //Texto Iniciar sesion
          //---------------------------
          SizedBox(height: 5),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Iniciar Sesion",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox(
                        height: 20,
                      ),


                      FadeAnimation(
                          1.4,
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text(
                                    "Usuario",
                                    style: TextStyle(
                                        color: Colors.green[900],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextField(
                                    controller: correoController,
                                    decoration: InputDecoration(
                                        hintText: "Correo Institucional",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextField(
                                    obscureText: true,
                                    controller: contraController,
                                    decoration: InputDecoration(
                                        hintText: "Contraseña",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      // SizedBox(height: 40,),
                      // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                      SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        height: 40.0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          Login(context);
                        },
                        color: Colors.green[900],
                        child: Text('Login',
                            style: TextStyle(color: Colors.white)),
                        elevation: 1.0,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Text(
                          "Registrarse",
                          style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),

                        //Esto provoca que naveguemos de un screen a otro
                        onTap: () {
                          // guardarIndex();

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterAlumno(),
                          ));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Login(BuildContext context) async {

    ItemUser user = ItemUser();
    user.setCorreo(correoController.text);
    user.setContra(contraController.text);

    consultaFirebase(user, context);
  }

  void consultaFirebase(ItemUser usuario, BuildContext context) {
    ref
        .child("Registro_Alumnos")
        .orderByChild("correo")
        .equalTo(usuario.getCorreo())
        .once()
        .then((DataSnapshot data) {

      if (data.value != null) {
        Map<dynamic, dynamic> map = data.value;

        ItemUser user = new ItemUser();
        user.setPlantel(map.values.toList()[0]['plantel']);
        user.setNombre(map.values.toList()[0]['nombre']);
        user.setCorreo(map.values.toList()[0]['correo']);
        user.setContra(map.values.toList()[0]['contraseña']);

        if (user.getcontra().compareTo(usuario.getcontra()) == 0) {
          //Guarda la informacion y ejecuta el cambio de ruta

          saveData(user, map.keys.first);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => TutorialScreen(),
          ));
        } else {
          showToast("Contraseña incorrecta");
        }
      } else {
        showToast("Usuario no registrado");
      }
    });
  }

  saveData(ItemUser user, String key) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("registro", true);

    _pref.setString("correo", user.getCorreo());
    _pref.setString("contra", user.getCorreo());
    _pref.setString("plantel", user.getPlantel());

    _pref.setString("idUser", key);
    _pref.setString("nombre", user.getNombre());
    _pref.setString("type", "Alumnos");
  }

  //------------------
  //Metodo se encarga de mostrar mensajes como toast
  //-----------------
  void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

}
