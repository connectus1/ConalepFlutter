import 'package:Conalep360/PreferencesClass.dart';
import 'package:flutter/cupertino.dart';

class PageCarreras extends StatefulWidget{

  @override
  PageCarrerasState createState() => PageCarrerasState();

}

class PageCarrerasState extends State<PageCarreras>{

  //Estos datos son para las institciones que manejan 4 carreras
  List<List> datos =[
    ['autotronica.png','contabilidad.png','programacion.png'],//Carreras Mante

    ['controldecalidad.png','programacion.png','mantenimientodesistemaselectronicos.png','maquinas.png'],//Carreras Matamoros

    ['autotronica.png','contabilidad.png','programacion.png'],//Carreras Miguel Aleman

    ['contabilidad.png','electromecanica.png','programacion.png','soporteymantenimientodecomputo.png'],//Carreras Nuevo Laredo
    ['progrmacion.png','autotronica.png','motoresadiesel.png','clima.png'],//Carreras Rio Bravo
    ['asistentedirectivo.png','electromecanica.png','programacion.png','mantenimientodesiststemaselectronicos.png'],//Datos Reynosa
    ['autotronica.png','construccion.png','programacion.png','quimica.png'], //Carrerras Tampico

    ['administracion.png','expresiongraficadigital.png','programacion.png','mantenimientoautomovil.png'], //Carreras Victoria
    [''],//Cast Matamoros
  ];
  List<List> name_carreras = [
    ['Autotronica','Contabilidad','Informatica'],
    ['Contabilidad','Informatica','Mantenimiento De Sistemas Electronicos','Maquinas'],
    ['Autotronica','Contabilidad','Informatica'],
    ['Contabilidad','Electromecanica','Informatica','Soporte y Mantenimiento De Computo'],
    ['Informatica','Autotronica','Motores a Diesel','Refrigeracion y Climatizacion'],
    ['Asistente Directivo','Electromecanica','Informatica','Mantenimiento de Siststemas Electronicos'],
    ['Autotronica','Construccion','Informatica','Quimica'],
    ['Administracion','Expresion Grafica Digital','Informatica','Mantenimiento de Automotriz'],
  ];

  int indexPlantel = 0;
  @override
  void initState() {
    loadIndex();
  }

  loadIndex(){
    Preferences preferences = Preferences();

    preferences.indexPlantel().then((value) => {
      setState((){
        indexPlantel = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    double font_size = 14.0;

    print(indexPlantel.toString());
    if(( indexPlantel == 0) || (indexPlantel == 3)){
      return PageView(
        scrollDirection: Axis.horizontal,

        children: <Widget>[
          Center(

            child:Column(
              children: [
                Image.asset('assets/iconos_carreras/' + (datos.elementAt(indexPlantel).elementAt(0)).toString(),height: 135.0,),
                Text(name_carreras.elementAt(indexPlantel).elementAt(0),style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),)
              ],
            ),
          ),
          Center(

            child:Column(
              children: [
                Image.asset('assets/iconos_carreras/' + (datos.elementAt(indexPlantel).elementAt(1)).toString(),height: 135.0,),
                Text(name_carreras.elementAt(indexPlantel).elementAt(1),style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),),
              ],
            ),
          ),
          Center(

            child:Column(
              children: [
                Image.asset('assets/iconos_carreras/' + (datos.elementAt(indexPlantel).elementAt(2)).toString(),height: 135.0, ),
                Text(name_carreras.elementAt(indexPlantel).elementAt(2),style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),),
              ],
            ),
          ),

        ],
      );
    }else{
      return PageView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Center(

            child:Column(
              children: [
                Image.asset('assets/iconos_carreras/' + (datos.elementAt(indexPlantel).elementAt(0)).toString() ,height: 135.0,),
                Text(name_carreras.elementAt(indexPlantel).elementAt(0),style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),),
              ],
            ),
          ),
          Center(

            child:Column(
              children: [
                Image.asset('assets/iconos_carreras/' + (datos.elementAt(indexPlantel).elementAt(1)).toString() ,height: 135.0,),
                Text(name_carreras.elementAt(indexPlantel).elementAt(1),style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),),
              ],
            ),
          ),
          Center(

            child:Column(
              children: [
                Image.asset('assets/iconos_carreras/' + (datos.elementAt(indexPlantel).elementAt(2)).toString() ,height: 135.0,),
                Text(name_carreras.elementAt(indexPlantel).elementAt(2),style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),),
              ],
            ),
          ),
          Center(

            child:Column(
              children: [
                Image.asset('assets/iconos_carreras/' + (datos.elementAt(indexPlantel).elementAt(3)).toString() ,height: 135.0,),
                Text(name_carreras.elementAt(indexPlantel).elementAt(3),style: TextStyle(fontWeight: FontWeight.bold,fontSize: font_size),),
              ],
            ),
          ),

        ],
      );

    }

  }


}