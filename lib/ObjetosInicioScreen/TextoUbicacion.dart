import 'package:Conalep360/PreferencesClass.dart';
import 'package:flutter/cupertino.dart';

class TextoUbicacion extends StatefulWidget{
  @override
  TextoState createState() => TextoState();


}

class TextoState extends State<TextoUbicacion>{

  List<String> direcciones = [
    'Avenida Rotaria, Unidad Hab Infonavit Arbustos #89817 Ciudad Mante, Tamaulipas', //Mante
    'De La Industria Sn, Fraccionamiento Parque Industrial del Norte, 87317 Heroica Matamoros, Tamps.',//Matamoros
    'Jalapa, Argüello, 88305 Cd Miguel Alemán, Tamps.', //Miguel Aleman
    'Río Grande Sn, Río Bravo, 88000 Nuevo Laredo, Tamps.', //Nuevo Laredo
    'CONALEP RIO BRAVO 200, Carr. Matamoros Mazatlan Km. 72 1 de Mayo, Conalep, 88900 Cd Río Bravo, Tamps.',//Rio Bravo
    'Prol. Londres S/N, La Cañada, 88700 Reynosa, Tamps.',//Reynosa
    'Calle General Emiliano Zapata y Lucio Blanco Col. Lopez Portillo Tampico',//Tampico
    'Calle Argentina 569, Amp la Libertad, 87019 Cd Victoria, Tamps.',//Victoria

    'Av. de la industria sn, parque industrial del norte #87315 Heroica Matamoros', //Cast Matamoros

  ];

  int index = 0;

  @override
  void initState() {
    loadIndex();
  }

  loadIndex(){
    Preferences preferences = Preferences();
    preferences.indexPlantel().then((value) => {
      setState((){
        index = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(direcciones.elementAt(index).toString(),style: TextStyle(),textAlign:TextAlign.justify,);
  }


}