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

    preferences.getPlantel().then((value) => {


      setState((){
          switch (value) {
            case "Mante":
              indexPlantel = 0;
              break;
            case "Matamoros":
              indexPlantel = 1;
              break;
            case "Miguel Aleman":
              indexPlantel = 2;
              break;
            case "Nuevo Laredo":
              indexPlantel = 3;
              break;
            case "Rio Bravo":
              indexPlantel = 4;
              break;
            case "Reynosa":
              indexPlantel = 5;
              break;
            case "Tampico":
              indexPlantel = 6;
              break;
            case "Victoria":
              indexPlantel = 7;
              break;
            case "Cast Matamoros":
              indexPlantel = 8;
              break;
          }



        // indexPlantel = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    double font_size = 14.0;

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
    //   return FutureBuilder<Widget>(
    //     future: setPageView(),);
    }

  }

  // Future<Widget> setPageView() async {
  //
  //   List<String> dataImages = [];
  //   List<String> names = [];
  //
  //
  //   switch(await Preferences().getPlantel()){
  //     case "Mante":
  //       names = ['Autotronica','Contabilidad','Informatica'];
  //       dataImages = ['autotronica.png','contabilidad.png','programacion.png'];
  //       break;
  //
  //     case "Matamoros":
  //       names =  ['Contabilidad','Informatica','Mantenimiento De Sistemas Electronicos','Maquinas'];
  //       dataImages = ['controldecalidad.png','programacion.png','mantenimientodesistemaselectronicos.png','maquinas.png'];//Carreras Matamoros
  //       break;
  //
  //     case "Miguel Aleman":
  //       names = ['Autotronica','Contabilidad','Informatica'];
  //       dataImages = ['autotronica.png','contabilidad.png','programacion.png'];//Carreras Miguel Aleman
  //       break;
  //     case "Nuevo Laredo":
  //       names = ['Contabilidad','Electromecanica','Informatica','Soporte y Mantenimiento De Computo'];
  //       dataImages = ['contabilidad.png','electromecanica.png','programacion.png','soporteymantenimientodecomputo.png'];//Carreras Nuevo Laredo
  //       break;
  //     case "Rio Bravo":
  //       names = ['Informatica','Autotronica','Motores a Diesel','Refrigeracion y Climatizacion'];
  //       dataImages =  ['progrmacion.png','autotronica.png','motoresadiesel.png','clima.png'];//Carreras Rio Bravo
  //       break;
  //     case "Reynosa":
  //       names =  ['Asistente Directivo','Electromecanica','Informatica','Mantenimiento de Siststemas Electronicos'];
  //       dataImages = ['asistentedirectivo.png','electromecanica.png','programacion.png','mantenimientodesiststemaselectronicos.png'];//Datos Reynosa
  //       break;
  //     case "Tampico":
  //       names = ['Autotronica','Construccion','Informatica','Quimica'];
  //       dataImages = ['autotronica.png','construccion.png','programacion.png','quimica.png'];//Carrerras Tampico
  //       break;
  //     case "Victoria":
  //       names = ['Administracion','Expresion Grafica Digital','Informatica','Mantenimiento de Automotriz'];
  //       dataImages = ['administracion.png','expresiongraficadigital.png','programacion.png','mantenimientoautomovil.png'];//Carreras Victoria
  //       break;
  //     case "Cast Matamoros": dataImages = [''];//Cast Matamoros
  //   }
  //
  //   return FutureBuilder(
  //     initialData: dataImages,
  //     builder: (BuildContext context, AsyncSnapshot<List<String>> data){
  //       if(dataImages == null)
  //         print("si");
  //
  //       print(data.hasData);
  //       print(data.connectionState);
  //       // if(data.connectionState){
  //       //
  //       // }
  //       return ListView.builder(
  //         itemCount: data.data.length,
  //         scrollDirection: Axis.vertical,
  //         itemBuilder: (BuildContext context, int index){
  //           List<String> datos = data.data;
  //
  //           return  Center(
  //             child:Column(
  //               children: [
  //                 Image.asset('assets/iconos_carreras/' + (datos.elementAt(index)).toString() ,height: 135.0,),
  //                 Text('${names.elementAt(index)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0),),
  //               ],
  //             ),
  //           );
  //
  //         },
  //       );
  //     },
  //   );


}