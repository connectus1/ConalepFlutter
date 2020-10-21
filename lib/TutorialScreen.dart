
import 'package:Conalep360/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';


BuildContext contexto;

class TutorialScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    contexto = context;
    return Scroll();
  }

}

class Scroll extends Scaffold{


  @override
  // TODO: implement body
  Widget get body => PageView(
    scrollDirection: Axis.vertical,
    children: <Widget>[

      _pagina("CONALERT",
          "Presiona este boton cuando te encuentres en peligro, tardara 3 segundos en enviar un mensaje con tu ubicacion a tus contactos de emergencia.",
          'ic_alerta.png'),

      _pagina("CONALEP360",
          "Tour Virtual 360° para que conozcas los planteles de CONALEP sin necesidad de ir presencialmente.",
          'ic_360.png'),

      _pagina("CHAT",
          "Comunicate con tu institucion directamente utilizando el chat que Conalep360 tiene para ti.",
          'ic_chat.png'),

      _pageFinal(),


    ],
  );
}

Stack _pagina(String tittle, String texto,String name_imagen) {
  return Stack(

    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        child:
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[

              SizedBox(height: 30,),
              Text(tittle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20,),
              Center(
                child: Image.asset(
                  'assets/iconos_tutorial/' + name_imagen.toString(),
                  width: 100, height: 100,),
              ),

              SizedBox(height: 45,),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Text(texto,
                  style: TextStyle(fontSize: 15,),
                ),
              ),
            ],
          ),
        ),
      ),

      Container(
        alignment: Alignment.bottomCenter,
        child: Icon(
          Icons.keyboard_arrow_down, color: Colors.black, size: 30.0,),
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
      ),

    ],
  );
}

  Stack _pageFinal() {
    return Stack(

      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child:
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[

                SizedBox(height: 30,),
                Text("REDES SOCIALES",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                SizedBox(height: 20,),
                Center(
                  child: Image.asset(
                    'assets/iconos_tutorial/ic_redes.png', width: 100,
                    height: 100,),
                ),


                SizedBox(height: 45,),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                  child: Text(
                    "Cuenta con las redes sociales mas importantes pertenecientes a la institución (Facebook, Youtube, Twitter).",
                    style: TextStyle(fontSize: 15,),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 30.0),
          child: FadeAnimation(1.6,
            Container(
              height: 50,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green[900]
              ),
              child: Center(
                child:
                InkWell(
                  child: Text("Iniciar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.of(contexto).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen())
                        , ModalRoute.withName('/'),);
                  },
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }



