import 'package:Conalep360/ObjectsLogin/FirebaseLoginVisitante.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ObjectsLogin/FirebaseLoginAlumno.dart';
import 'ObjectsLogin/FirebaseLoginTutor.dart';

class TypeUserScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/banner.png'),
                ),
              ),
            ),

            Center(child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo_app.png',width: 80,height: 80,),
                ],
              ),
            ),),


            Center(
              child:Container(
                padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                child: Text("Te Damos la vienvenida a la apliacion oficial de CONALEP, por favor selecciona una de las siguientes opciones",
                  textAlign: TextAlign.justify,),
              ),
            ),

            SizedBox(height: 40,),
            MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child:Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  // padding: EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/iconos_type/alumno.png',height: 30,),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text("Alumno",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),

                        ),
                      ),

                    ],

                  ),
                ),
                onPressed: (){
                  loginAlumno(context);
                }),

            // InkWell(
            //   child: Container(
            //     height: 55,
            //     width: MediaQuery.of(context).size.width * 0.8,
            //     padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
            //     child: Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       child: Container(
            //         alignment: Alignment.centerLeft,
            //         child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: <Widget>[
            //           Container(
            //             alignment: Alignment.center,
            //             child: Image.asset('assets/iconos_type/alumno.png'),
            //           ),
            //           Text("Alumno",textAlign: TextAlign.center,
            //             style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //
            //       // Text("Alumno",textAlign: TextAlign.center,
            //       //     style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            //       //   ),
            //
            //         padding: EdgeInsets.fromLTRB(0, 10, 0, 0.0),
            //       ),
            //
            //     ),
            //   ),
            //   onTap: (){
            //     loginAlumno(context);
            //   },
            // ),

            MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child:Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  // padding: EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/iconos_type/tutor.png',height: 30,),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text("Tutor",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),

                        ),
                      ),

                    ],

                  ),
                ),
                onPressed: (){
                  loginTutor(context);
                }),

            //
            // InkWell(
            //   child: Container(
            //     height: 55,
            //     width: MediaQuery.of(context).size.width * 0.8,
            //     padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
            //     child: Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //
            //       child: Container(
            //         alignment: Alignment.centerLeft,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: <Widget>[
            //             Container(
            //               alignment: Alignment.center,
            //               child: Image.asset('assets/iconos_type/tutor.png'),
            //             ),
            //             Text("Alumno",textAlign: TextAlign.center,
            //               style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         ),
            //       ),
            //
            //       // child:
            //       // Container(child: Text("Tutor",textAlign: TextAlign.center,
            //       //   style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            //       // ),
            //       //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0.0),
            //       // ),
            //
            //
            //     ),
            //   ),
            //   onTap: (){
            //     loginTutor(context);
            //   },
            // ),

            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child:Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 10),
                // padding: EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/iconos_type/visita.png',height: 30,),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Visita",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),

                      ),
                    ),

                  ],

                ),
              ),
                onPressed: (){
              loginVisita(context);
            }),

            // SizedBox(height: 30,),
            //     InkWell(
            //     child: Container(
            //     height: 55,
            //     width: MediaQuery.of(context).size.width * 0.8,
            //     padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
            //     child: Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       // child:
            //       child: Container(
            //       alignment: Alignment.centerLeft,
            //       child: Row(
            //
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: <Widget>[
            //
            //           Container(
            //             alignment: Alignment.center,
            //             child: Image.asset('assets/iconos_type/visita.png',height: 100,),
            //           ),
            //           Container(
            //             alignment: Alignment.centerLeft,
            //             child: Text("Visita",textAlign: TextAlign.center,
            //               style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            //
            //             ),
            //           ),
            //           // Center(child:
            //           //   Text("Alumno",textAlign: TextAlign.center,
            //           //     style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            //           //
            //           //   ),
            //           // )
            //
            //         ],
            //       ),
            //       ),
            //
            //       // Container(child: Text("Visitante",textAlign: TextAlign.center,
            //       //   style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            //       // ),
            //       //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0.0),
            //       // ),
            //
            //
            //     ),
            //   ),
            //   onTap: (){
            //   loginVisita(context);
            //   },
            //   ),


          ],
        ),
      );
  }

  //-------------------
  //Se encarga de reemplazar fragment actual
  //--------------------
  void loginAlumno(BuildContext context){
    Navigator.push(context,MaterialPageRoute(
          builder: (context) => FirebaseLoginAlumno()),
    );
  }

  void loginTutor(BuildContext context){
    Navigator.push(context,MaterialPageRoute(
        builder: (context) => FirebaseLoginTutor()),
    );
  }

  void loginVisita(BuildContext context){
    Navigator.push(context,MaterialPageRoute(
        builder: (context) => FirebaseLoginVisitante()),
    );
  }


}