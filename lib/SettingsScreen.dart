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
                  color: Colors.green[900],fontSize: 16,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,),
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: ListDown(),
            ),

          ],
        ),
      ),

    );
  }

}

class ListDown extends StatefulWidget{
  ListDown({Key key}) : super(key: key);

  @override
  _ListDownState createState() => _ListDownState();

}

class _ListDownState extends State<ListDown>{



  String oneElement = 'Mante';

  List<String> _plantel =   [
    'Mante', 'Matamoros', 'Miguel Aleman', 'Nuevo Laredo',
    'Rio Bravo', 'Reynosa', 'Tampico','Victoria','Cast Matamoros'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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

  ///Guarda el indice del plantel seleccionado
  Future guardarIndex(int index) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // print(indexPlantel.toString());

    await preferences.setInt('index', index);//Guarda el indice del DropDownButton
    // preferences = null;
  }

  @override
  void initState() {
    guardarIndex(0);
  }

}

