
import 'package:flutter/cupertino.dart';

import '../PreferencesClass.dart';

class TextoTelefono extends StatefulWidget{
  @override
  TelefonoState createState() => TelefonoState();


}

class TelefonoState extends State<TextoTelefono>{

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
    _pref.indexPlantel().then((value) => {
      setState((){
        index = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(telefonos.elementAt(index).toString());
  }

}