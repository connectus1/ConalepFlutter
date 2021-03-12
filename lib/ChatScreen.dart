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
  switch (position) {
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

  //-----------------------------
  //cuando el state del objeto es removido
  //----------------------------
  // @override
  // void dispose() {
  //   ref.onDisconnect();
  // }

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

              Expanded(child: FutureBuilder(
                    future: db.initDB(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print("ListView" + snapshot.connectionState.toString());
                      if(snapshot.connectionState == ConnectionState.done){
                        return _showList(context);
                      }else
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                    }
                ),
              ),
              SizedBox(width: 10,),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 70,
                color: Colors.green[900],
                child: Row(
                  children: <Widget>[

                    Container(
                      // color: Colors.white,
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
      guardarMensaje(_mensajeAux);


      txtChat.clear();
    }

  }

  //------------------------------------
  //Esta parte del codigo retorna un FutureBuilder que contiene un ListView.Builder para obtener los mensajes
  //que se encuentran en la base de datos SQL y agrega de los que entran de Firebase
  //-----------------------------------
  _showList(BuildContext context){
    return FutureBuilder(
      future: db.getMessages(),
        builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot){
        print("ListView" + snapshot.hasData.toString());

          if(snapshot.hasData){

            return ListView.builder(
              reverse: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                List<Message> message = snapshot.data;

                //Verifica que el nombre sea
                if (message.elementAt((message.length-1)-index).nombre.compareTo("CONALEP") == 0) {
                  return _crearItem(context, message.elementAt((message.length-1) - index));
                }
                else
                  return _crearItemUser(context, message.elementAt((message.length-1) - index));

              },
            );
          }else
            return Center(
              child: Text("Loading...."),
            );
        }
    );
  }

  //--------------------------------------
  //Crea el objeto grafico para los widget del plantel
  //----------------------------------
  Widget _crearItem(BuildContext context, Message mensaje){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      //-------------------
      // codigo para la foto del mensaje
      //--------------------
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow:[ BoxShadow(
                color: Colors.white.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
            ],
          ),
          child: CircleAvatar(radius: 17,
            backgroundImage: AssetImage('assets/images/logo_app.png'),
          )
        ),


        //--------------------
        //Codigo para crear el item del mensaje
        //----------------------
        Container(
          alignment: Alignment.topLeft,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
          ),
          child: Text('${mensaje.mensaje}',style: TextStyle(color: Colors.black),),
        ),
      ],
    );
  }

  //-----------------------------------------------------
  //Crea un item para Usuario
  //-----------------------------------------------
  Widget _crearItemUser(BuildContext context, Message mensaje){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        //--------------------
        //Codigo para crear el item del mensaje
        //----------------------
        Container(
          alignment: Alignment.topRight,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
        // EdgeInsets.symmetric(vertical: 10,horizontal: 15)
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(35, 10, 0.0, 10),
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
            ],
          ),
          child: Text('${mensaje.mensaje}',style: TextStyle(color: Colors.white),),
        ),

        //-------------------
        // codigo para la foto del mensaje
        //--------------------
        Container(
            padding: EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow:[ BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
              ],
            ),
            child: CircleAvatar(radius: 17,
              backgroundImage: AssetImage('assets/images/logo_app.png'),
            )
        ),

      ],
    );
  }
}


