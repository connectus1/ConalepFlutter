import 'package:Conalep360/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            InkWell(
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:
                  Container(child: Text("Alumno",textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0.0),
                  ),


                ),
              ),
              onTap: (){
                loginScreen(context, true);
              },
            ),

            SizedBox(height: 30,),
                InkWell(
                child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:
                  Container(child: Text("Visitante",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0.0),
                  ),


                ),
              ),
              onTap: (){
              loginScreen(context, true);
              },
              ),


          ],
        ),
      );
  }

  //-------------------
  //Se encarga de reemplazar fragment actual
  //--------------------
  void loginScreen(BuildContext context,bool type){
    Navigator.push(context,MaterialPageRoute(
          builder: (context) => LoginScreen(
            typeUser: type,
          )),
    );

  }


}