import 'package:Conalep360/PreferencesClass.dart';
import 'package:flutter/cupertino.dart';

class TextoUbicacion extends StatefulWidget{
  @override
  TextoState createState() => TextoState();
}

class TextoState extends State<TextoUbicacion>{
  String txtUbicacion;

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

  // int index = 0;

  @override
  void initState() {
    loadIndex();
  }

  loadIndex(){
    Preferences _pref = Preferences();

    _pref.getPlantel().then((value) => {

      setState((){
        switch(value){
          case "Mante": txtUbicacion = '${direcciones.elementAt(0)}'; break;
          case "Matamoros": txtUbicacion = '${direcciones.elementAt(1)}'; break;
          case "Miguel Aleman": txtUbicacion = '${direcciones.elementAt(2)}'; break;
          case "Nuevo Laredo": txtUbicacion = '${direcciones.elementAt(3)}'; break;
          case "Rio Bravo": txtUbicacion= '${direcciones.elementAt(4)}'; break;
          case "Reynosa": txtUbicacion= '${direcciones.elementAt(5)}'; break;
          case "Tampico": txtUbicacion= '${direcciones.elementAt(6)}'; break;
          case "Victoria": txtUbicacion = '${direcciones.elementAt(7)}'; break;
          case "Cast Matamoros": txtUbicacion = '${direcciones.elementAt(8)}'; break;

        }
        // txtPhone = '${value}';
      }),

    });

  }

  @override
  Widget build(BuildContext context) {
    return Text('${txtUbicacion}',style: TextStyle(),textAlign:TextAlign.justify,);

  }


}