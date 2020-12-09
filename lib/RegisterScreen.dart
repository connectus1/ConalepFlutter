
import 'package:Conalep360/FirebaseObjects/Login/ItemUser.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Animation/FadeAnimation.dart';

class RegisterScreen extends StatelessWidget {
  bool typeUser;
  RegisterScreen({this.typeUser});

  //Controladores de los textos
  TextEditingController correoController = new TextEditingController();
  TextEditingController contraController = new TextEditingController();
  TextEditingController contra_confirmoController = new TextEditingController();
  TextEditingController nombreController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              height: 90,
              child: Stack(
                children: <Widget>[
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


            Center(child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_app.png', width: 80, height: 80,),
                  SizedBox(height: 5,),
                  Center(
                    child: Text("Registrate", style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  // SizedBox(height: 10,),
                  // FadeAnimation(1.3, Text("¡REGISTRATE!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                ],
              ),
            ),),


            SizedBox(height: 10),
            Expanded(
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                // ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 40.0),
                    child:
                    Column(
                      children: <Widget>[


                        SizedBox(height: 20,),
                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )
                              ]
                          ),

                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20,),
                              Container(
                                child: Text(
                                  "Selecciona un plantel", style: TextStyle(
                                    color: Colors.green[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,),
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                alignment: Alignment.centerLeft,
                              ),


                              Container(
                                child: ListDown(),
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(10, 5, 20, 0),
                              ),


                              SizedBox(height: 25,),
                              Container(
                                child: Text("Usuario", style: TextStyle(
                                    color: Colors.green[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,),
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                alignment: Alignment.centerLeft,
                              ),

                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]))
                                ),
                                child:
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Correo Institucional",

                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  controller: correoController,
                                ),
                              ),

                              ///Nombre Del usuario
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]))
                                ),
                                child:
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Nombre",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  controller: nombreController,
                                ),
                              ),

                              ///Contraseña del usuario
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Contraseña",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  controller: contraController,
                                ),
                              ),

                              ///Confirmar contraseña
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Confirmar Contraseña",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  controller: contra_confirmoController,
                                ),
                              ),


                            ],
                          ),
                        )),
                        // SizedBox(height: 40,),
                        // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 40,),

                        MaterialButton(
                          height: 40.0,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            consultaFirebase(context);
                          },
                          color: Colors.green[900],
                          child: Text('Registrar', style: TextStyle(color: Colors.white)),
                          elevation: 1.0,
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //------------------------
  //Revisa que todos los datos esten llenos
  //------------------
  bool revisarDatos(List data) {
    data.forEach((element) {
      if ((element.toString().compareTo("") == 0) ||
          (element.toString().compareTo(" ") == 0)) {
        return false;
      }
    });
    return true;
  }

  void consultaFirebase(BuildContext context){
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    String child = "";
    //Define a que rama apuntar en la base de datos
    if (typeUser)
      child = "Registro_Alumnos";
    else
      child = "Registro_Visitas";

    ref.child(child).orderByChild("correo").equalTo(correoController.text).once().then((DataSnapshot data){
      if(data.value != null){
        print('data: ${data.value}');
        showToast("Usuario registrado"); //El usuario no se puede registrar 2 veces
        return false;
      }else{

        if(typeUser){

          if(styleCorreoAlumno(correoController.text)){
            registerDatabase(context,ref,child);
          }else{
            showToast("Correo no aceptado");

          }
        }else{
          registerDatabase(context,ref,child);
        }

      }

    });

  }

  registerDatabase(BuildContext context,DatabaseReference ref,String child) async {
    List data = [
      correoController.text,
      contraController.text,
      contra_confirmoController.text,
      nombreController.text,
    ];

    bool flag = revisarDatos(data);

    if (flag) {
      if (contraController.text.compareTo(contra_confirmoController.text) ==0) {

        ItemUser user = setDataUser();
        SharedPreferences preferences = await SharedPreferences.getInstance();
        user.setPlantel(preferences.getString("plantel"));

        //Termino de registrar los datos en firebase
        ref.child(child).push().set({
          'contraseña': user.getcontra(),
          'correo': user.getCorreo(),
          'nombre': user.getNombre(),
          'plantel': user.getPlantel(),
        });

        showToast("Registrado Exitosamente");
        Navigator.of(context).pop();

      }else
        showToast("Contraseñas no coinciden");
    }else
      showToast("Algun dato sin rellenar");

  }

   //-------------------------
  // Muestra un toast con informacion
  //-------------------------
  void showToast(String text){
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }

  //--------------------------------
  //Regresa un objeto ItemUser
  //-------------------------------
  ItemUser setDataUser(){

    ItemUser user = new ItemUser();
    user.setNombre(nombreController.text);
    user.setContra(contraController.text);
    user.setCorreo(correoController.text);

    return user;
  }

  //-------------------------------------------------------
  //Metodo que se encarga de establecer el hint
  //-------------------------------------------------------
  String setTxtCorreo() {
    if (typeUser) {
      return "Correo Institucional";
    } else {
      return "Correo electronico";
    }
  }

  //-------------------------------------------------------
  //Metodo que se revisa el correo y sea institucional
  //-------------------------------------------------------
  bool styleCorreoAlumno(String text){
    String estilo_correo = "conalep.edu.mx";
    return (text.indexOf(estilo_correo) != -1) ? true : false;
  }

}





//-------------------------------------------------------
//Clase que guarda el estado del widget para hacer la lista
//desplegable
//-------------------------------------------------------
class ListDown extends StatefulWidget{
  ListDown({Key key}) : super(key: key);

  @override
  _ListDownState createState() => _ListDownState();

}

class _ListDownState extends State<ListDown>{
  String oneElement = 'Mante';

  List<String> _plantel =   [
    'Mante', 'Matamoros', 'Miguel Aleman', 'Nuevo Laredo',
    'Rio Bravo', 'Reynosa', 'Tampico','Victoria','Cast Matamoros'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: oneElement,
      elevation: 16,
      style: TextStyle(color: Colors.blue[700],fontSize: 16),

      onChanged: (String newValue) {
        setState(() {
          oneElement = newValue;
        });
      },


      items: _plantel.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }


}