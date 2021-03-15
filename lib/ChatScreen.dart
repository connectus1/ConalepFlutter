import 'package:Conalep360/ObjetosChat/ListViewChat.dart';
import 'package:Conalep360/PreferencesClass.dart';
import 'package:Conalep360/SQLiteObjects/DatabaseProvider.dart';
import 'package:Conalep360/SQLiteObjects/Message.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//******************************
//Atributos De la clase
//******************************
DatabaseReference ref;

String idUser;
int indexUser;

TextEditingController txtChat = new TextEditingController();
final ScrollController _scrollController = new ScrollController(initialScrollOffset: _scrollController.position.maxScrollExtent);

List<String> keys = new List();


setUrl(int position){
  switch (position-1) {
    case 0: return 'https://conalep360-mante.firebaseio.com/';
    case 1: return 'https://conalep360-matamoros.firebaseio.com/';
    case 2: return 'https://conalep360-miguelaleman.firebaseio.com/';
    case 3: return 'https://conalep360-nuevolaredo.firebaseio.com/';
    case 4: return 'https://conalep360-reynosa.firebaseio.com/';
    case 5: return 'https://conalep360-riobravo.firebaseio.com/';
    case 6: return 'https://conalep360-tampico.firebaseio.com/';
    case 7: return 'https://conalep360-victoria.firebaseio.com/';
    case 8: return 'https://conalep360-cast.firebaseio.com/';
  }
}

class Chat extends StatefulWidget {
  Chat(int index){indexUser = index;}

  @override
  _ChatState createState() => _ChatState();
}

//***********************************
//Esta clase se encarga del State de la clase Chat
//****************************************
class _ChatState extends State<Chat> {

  ListViewChat _chat = ListViewChat();
  var db = DatabaseProvider();
  String nombre;

  //********************************
  //Metodo Future que recolecta la informacion de los mensajes en la base de datos
  //Hace referencia y despues la snapshot lo convierte en un Map<dynamic,dynamic> y los agrega a un list que retorna
  //******************************
  _getMensaje() async {
    idUser = await Preferences().getIdUser();

    ref.child("Chat").child(idUser).once().then((DataSnapshot data) {
      if (data.value != null) {
        Map<dynamic, dynamic> map = data.value;

        for (int i = 0; i < map.length; i++) {
          Message mensaje = new Message(fecha: map.values.toList()[i]['fecha'],
              mensaje: map.values.toList()[i]['mensaje'],
              nombre: map.values.toList()[i]['nombre']);

          //Si el mensaje proviene de la institucion entonces se guarda el mensahe
          if(mensaje.nombre.compareTo("CONALEP") == 0 ){
            guardarMensaje(mensaje);
            _chat.addMessage(mensaje);

            ref.child("Chat").child(idUser).child(map.keys.elementAt(i)).remove();//Como ya se agrego al SQL se elimina de Firebase
          }

        }
      }
    });

  }

  //-----------------------------
  //Metodo para guardar los mensajes en la base de datos SQLite
  //----------------------------
  Future guardarMensaje(Message mensaje) async {
    await db.saveMessage(mensaje);
  }

  @override
  void initState() {
    Preferences().getNombre().then((value) => (){
      nombre = value;
    });

  }

  //*****************************
  //Se construye
  //****************************
  @override
  Widget build(BuildContext context) {

    ref = FirebaseDatabase(databaseURL: setUrl(indexUser)).reference();
    _getMensaje();

    return Scaffold(
      body: Container(
          child: Column(
            children: [
              Expanded(child: _chat),

              SizedBox(width: 10,),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 70,
                color: Colors.green[900],
                child: Row(
                  children: <Widget>[

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: MediaQuery.of(context).size.width * 0.82,
                      child: TextField(

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            hintText: "Ingrese un mensaje",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                        ),
                        controller: txtChat,
                      ),
                    ),

                    FloatingActionButton(
                      onPressed: _sendMessages,
                      backgroundColor: Colors.lightGreen[800],
                      child: Icon(Icons.arrow_forward_rounded),
                      mini: true,
                    ),

                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  //Metodo que revisa los mensajes antes de enviarse
  _sendMessages() {
    if(txtChat.value.text.isNotEmpty){//Revisa que la caja de texto no este vacia

      int i = 0;
      String data = txtChat.value.text;

      //Recorre del final al inicio buscando espacios en blanco inecesarios
      for(i = data.length-1;i >=0;i--) {
         if (data.codeUnitAt(i) != 32) {
            break;
         }
      }

      //Una vez identificado el rango, toma desde i hasta su longitud para eliminar los espacios en blanco
      String newData = data.replaceRange(i+1, data.length, "");

      Message _mensajeAux = Message(fecha: DateFormat().format(DateTime.now()),mensaje: newData,nombre: "Luis");
      ref.child("Chat").child(idUser).push().set(_mensajeAux.toMap());

      guardarMensaje(_mensajeAux); //Lo guarda en la base de datos

      _chat.addMessage(_mensajeAux); //Lo anexa al ListView


      txtChat.clear();
    }

  }
}


