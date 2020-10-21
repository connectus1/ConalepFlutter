import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaPlantel extends StatefulWidget{

  @override
  ListaState createState() => ListaState();

}

class ListaState extends State<ListaPlantel>{

  String oneElement = 'Mante';

  List<String> _plantel =   [
    'Mante', 'Matamoros', 'Miguel Aleman', 'Nuevo Laredo',
    'Rio Bravo', 'Reynosa', 'Tampico','Victoria','Cast Matamoros'];


  ///Guarda el indice del plantel seleccionado
  Future guardarIndex(int index) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('index', index);//Guarda el indice del DropDownButton
    // preferences = null;
  }

  @override
  void initState() {
    guardarIndex(0);
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: oneElement,
      elevation: 16,
      style: TextStyle(color: Colors.blue[700],fontSize: 16),

      onChanged: (String newValue) {
        setState(() {
          print(_plantel.indexOf(newValue).toString());
          guardarIndex(_plantel.indexOf(newValue));
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