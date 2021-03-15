import 'package:Conalep360/SQLiteObjects/DatabaseProvider.dart';
import 'package:Conalep360/SQLiteObjects/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<Message> mensajes = new List();

class ListViewChat extends StatefulWidget{
  ViewState state = ViewState();

  addMessage(Message mensaje){
    state.addMessage(mensaje);
  }

  @override
  ViewState createState() => state;

}

class ViewState extends State<ListViewChat>{

  //Variable que apunta a la clase DatabaseProvier
  var db = DatabaseProvider();


  //Cuando inicie el estado del widget
  @override
  void initState() {
    _loadMensajes();
  }

  //Metodo asyncrono que carga los mensajes y despues establece el estado de un objeto
  _loadMensajes() async{
      await db.initDB();
      mensajes = await db.getMessages();
  }

  //Metodo utilizado para agregar mensajes al arreglo
  addMessage(Message mensaje){
    setState(() {
      mensajes.add(mensaje);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mensajes.length,
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (BuildContext context, int index){

          //Verifica que el nombre sea
          if (mensajes.elementAt((mensajes.length-1)-index).nombre.compareTo("CONALEP") == 0) {
            return _crearItem(context, mensajes.elementAt((mensajes.length-1) - index));
          }
          else
            return _crearItemUser(context, mensajes.elementAt((mensajes.length-1) - index));

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