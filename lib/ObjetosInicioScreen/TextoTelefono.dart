
import 'package:flutter/cupertino.dart';

import '../PreferencesClass.dart';

class TextoTelefono extends StatefulWidget{
  @override
  TelefonoState createState() => TelefonoState();
}

class TelefonoState extends State<TextoTelefono>{
  String txtPhone;


  int index = 0;
  List<String> telefonos = [
    "2322671", //Mante
    "81001138100732", //Matamoros
    "8979723469", //Miguel Aleman
    "8677108752", //Nuevo Laredo
    "8999343891", //Rio Bravo
    "8999247621", //Reynosa
    "8332118109", //Tampico
    "8343140844", //Victoria
    "8688100121" //Cast Matamoros
  ];

  @override
  void initState() {
    loadIndex();
  }

  loadIndex(){
    Preferences _pref = Preferences();
    _pref.getPlantel().then((value) => {

      setState((){
        switch(value){
          case "Mante": txtPhone = '${telefonos.elementAt(0)}'; break;
          case "Matamoros": txtPhone = '${telefonos.elementAt(1)}'; break;
          case "Miguel Aleman": txtPhone = '${telefonos.elementAt(2)}'; break;
          case "Nuevo Laredo": txtPhone = '${telefonos.elementAt(3)}'; break;
          case "Rio Bravo": txtPhone = '${telefonos.elementAt(4)}'; break;
          case "Reynosa": txtPhone = '${telefonos.elementAt(5)}'; break;
          case "Tampico": txtPhone = '${telefonos.elementAt(6)}'; break;
          case "Victoria": txtPhone = '${telefonos.elementAt(7)}'; break;
          case "Cast Matamoros": txtPhone = '${telefonos.elementAt(8)}'; break;

        }
        // txtPhone = '${value}';
      }),

    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('${txtPhone}');
    // return Text(telefonos.elementAt(index).toString());
  }

}