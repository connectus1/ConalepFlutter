import 'package:Conalep360/ObjetosSettingScreen/ListaPlantel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[

            Container(
              child:Text("Selecciona un plantel", style: TextStyle(
                  color: Colors.green[900],fontSize: 14,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              alignment: Alignment.centerLeft,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: ListaPlantel(),
            ),

          ],
        ),
      ),

    );
  }

}
//
// class ListDown extends StatefulWidget{
//   ListDown({Key key}) : super(key: key);
//
//   @override
//   _ListDownState createState() => _ListDownState();
//
// }
//
// class _ListDownState extends State<ListDown>{
//

  //
  // String oneElement = 'Mante';
  //
  // List<String> _plantel =   [
  //   'Mante', 'Matamoros', 'Miguel Aleman', 'Nuevo Laredo',
  //   'Rio Bravo', 'Reynosa', 'Tampico','Victoria','Cast Matamoros'];

  // @override
  // Widget build(BuildContext context) {
  //   return ListDown();
    //   DropdownButton<String>(
    //   isExpanded: true,
    //   value: oneElement,
    //   elevation: 16,
    //   style: TextStyle(color: Colors.blue[700],fontSize: 16),
    //
    //   onChanged: (String newValue) {
    //     setState(() {
    //       print(_plantel.indexOf(newValue).toString());
    //       guardarIndex(_plantel.indexOf(newValue));
    //       oneElement = newValue;
    //     });
    //
    //   },
    //
    //
    //   items: _plantel.map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //
    //       child: Text(value),
    //     );
    //   }).toList(),
    // );
  // }

  //Guarda el indice del plantel seleccionado
  // Future guardarIndex(int index) async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setInt('index', index);//Guarda el indice del DropDownButton
  //
  //
  // }
  //
  // @override
  // void initState() {
  //   // guardarIndex(0);
  // }

// }

