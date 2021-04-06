import 'package:Conalep360/PreferencesClass.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DialogNoticia.dart';
import 'Noticia.dart';

List<Noticia> noticias = new List();
DatabaseReference ref;
int indexUser;
String urlDatabase;


class ListViewNoticia extends StatefulWidget{
  ViewState state = ViewState();
  
  // addMessage(Noticia noticia){
  //   state.addNoticia(noticia);
  // }

  @override
  ViewState createState() => state;

  addNoticia(Noticia noticia) => state.addNoticia(noticia);
}

class ViewState extends State<ListViewNoticia>{

  addNoticia(Noticia noticia) {
    bool flag = true;

    for (int i = 0; i < noticias.length && flag; i++) {
      if (noticias.elementAt(i).toString().compareTo(noticia.toString()) == 0) {
        flag = false;
      }
    }
    if (flag) {
      setState(() {
        noticias.add(noticia);
      });
    }
  }
  //Variable que apunta a la clase DatabaseProvier
  // var db = DatabaseProvider();


  //Cuando inicie el estado del widget
  @override
  void initState() {
    // _loadPlantel();
    // _loadMensajes();
  }


  

  //Metodo asyncrono que carga los mensajes y despues establece el estado de un objeto
  // _loadMensajes() async{
  //   await db.initDB();
  //   Noticias = await db.getMessages();
  // }
  
  // _loadPlantel() async{
  //   Preferences _pref = Preferences();
  //   String plantel = await _pref.getPlantel();
  //
  //   setState(() {
  //     urlDatabase = setUrl(plantel);
  //   });
  //
  // }
  
  //Metodo utilizado para agregar mensajes al arreglo
  // addNoticia(Noticia noticia){
  //   setState(() {
  //     noticias.add(noticia);
  //   });
  // }

  // getNoticias() async {
  //   ref.child("Noticias").once().then((DataSnapshot data) {
  //     if (data.value != null) {
  //       Map<dynamic, dynamic> map = data.value;
  //
  //       for (int i = 0; i < map.length; i++) {
  //
  //
  //         Noticia noticia = new Noticia(
  //             fecha: map.values.toList()[i]['fecha'],
  //             titulo: map.values.toList()[i]['titulo'],
  //             noticia: map.values.toList()[i]['noticia'],
  //             url: map.values.toList()[i]['url']);
  //
  //         noticias.add(noticia);
  //
  //         //Si el mensaje proviene de la institucion entonces se guarda el mensahe
  //         // if(mensaje.nombre.compareTo("CONALEP") == 0 ){
  //         //   guardarMensaje(mensaje);
  //         //   _chat.addMessage(mensaje);
  //         //
  //         //   ref.child("Chat").child(idUser).child(map.keys.elementAt(i)).remove();//Como ya se agrego al SQL se elimina de Firebase
  //         // }
  //
  //       }
  //     }
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {

    // getNoticias();

    return ListView.builder(
        itemCount: noticias.length,
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        noticias.elementAt(index).url,
                      ),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              noticias.elementAt(index).titulo,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              noticias.elementAt(index).fecha,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DialogNoticia(noticias.elementAt(index))));
                      },
                    ),
                    // Container(child: ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
          // return Container(
          //   child: Row(children: <Widget>[
          //       CircleAvatar(child: Image.network(noticias.elementAt(index).url),),
          //       Column(children: <Widget>[
          //         Text(noticias.elementAt(index).titulo),
          //         Text(noticias.elementAt(index).fecha),
          //       ],)
          //       // SizedBox(height: 20,)
          //     ],),
          // );
          //Verifica que el nombre sea
          // if (Noticias.elementAt((Noticias.length-1)-index).nombre.compareTo("CONALEP") == 0) {
          //   return _crearItem(context, Noticias.elementAt((Noticias.length-1) - index));
          // }
          // else
          //   return _crearItemUser(context, Noticias.elementAt((Noticias.length-1) - index));

        }
    );
  }

  //--------------------------------------
  //Crea el objeto grafico para los widget del plantel
  //----------------------------------
  // Widget _crearItem(BuildContext context, Message mensaje){
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //
  //     //-------------------
  //     // codigo para la foto del mensaje
  //     //--------------------
  //     children: <Widget>[
  //       Container(
  //           padding: EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             boxShadow:[ BoxShadow(
  //               color: Colors.white.withOpacity(0.5),
  //               spreadRadius: 2,
  //               blurRadius: 5,
  //             ),
  //             ],
  //           ),
  //           child: CircleAvatar(radius: 17,
  //             backgroundImage: AssetImage('assets/images/logo_app.png'),
  //           )
  //       ),
  //
  //
  //       //--------------------
  //       //Codigo para crear el item del mensaje
  //       //----------------------
  //       Container(
  //         alignment: Alignment.topLeft,
  //         constraints: BoxConstraints(
  //           maxWidth: MediaQuery.of(context).size.width * 0.8,
  //         ),
  //         padding: EdgeInsets.all(10),
  //         margin: EdgeInsets.symmetric(vertical: 10),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(15),
  //           boxShadow: [BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //           ),
  //           ],
  //         ),
  //         child: Text('${mensaje.mensaje}',style: TextStyle(color: Colors.black),),
  //       ),
  //     ],
  //   );
  // }

  //-----------------------------------------------------
  //Crea un item para Usuario
  //-----------------------------------------------
  // Widget _crearItemUser(BuildContext context, Message mensaje){
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //
  //       //--------------------
  //       //Codigo para crear el item del mensaje
  //       //----------------------
  //       Container(
  //         alignment: Alignment.topRight,
  //         constraints: BoxConstraints(
  //           maxWidth: MediaQuery.of(context).size.width * 0.8,
  //         ),
  //         // EdgeInsets.symmetric(vertical: 10,horizontal: 15)
  //         padding: EdgeInsets.all(10),
  //         margin: EdgeInsets.fromLTRB(35, 10, 0.0, 10),
  //         decoration: BoxDecoration(
  //           color: Colors.green[300],
  //           borderRadius: BorderRadius.circular(15),
  //           boxShadow: [BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //           ),
  //           ],
  //         ),
  //         child: Text('${mensaje.mensaje}',style: TextStyle(color: Colors.white),),
  //       ),
  //
  //       //-------------------
  //       // codigo para la foto del mensaje
  //       //--------------------
  //       Container(
  //           padding: EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             boxShadow:[ BoxShadow(
  //               color: Colors.white.withOpacity(0.5),
  //               spreadRadius: 2,
  //               blurRadius: 5,
  //             ),
  //             ],
  //           ),
  //           child: CircleAvatar(radius: 17,
  //             backgroundImage: AssetImage('assets/images/logo_app.png'),
  //           )
  //       ),
  //
  //     ],
  //   );
  // }

}