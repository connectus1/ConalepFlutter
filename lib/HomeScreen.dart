import 'package:Conalep360/ChatScreen.dart';
import 'package:Conalep360/PoliticaDePrivacidadScreen.dart';
import 'package:Conalep360/RecorridoVirtualScreen.dart';
import 'package:Conalep360/SettingsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GoogleMapScreen.dart';
import 'InicioScreen.dart';

import 'PreferencesClass.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<HomeScreen>{
  int select_drawer = 0;
  double size_icon = 23;


  _getDrawerItemWidget(int position){

    switch(position){
      case 0: return InicioScreen();
      case 1: return GoogleMapScreen();
      case 2: return RecorridoVirtualScreen();
      case 3: return SettingScreen();
      case 4: return PoliticaDePrivacidadScreen();
    }

  }
  
  _setTextAppBar(int position){
    switch(position){
      case 0: return "Inicio";
      case 1: return "Mapa";
      case 2: return "Conalep 360";
      case 3: return "Ajustes";
      case 4: return "Politica De Privacidad";
    }

  }
  
  _onSelectItem(position){
    setState((){
      select_drawer = position;
    });
  }

  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }


  @override
  void initState(){
    Preferences _pref = Preferences();
    // position =  _pref.indexPlantel();
    // idUser = _pref.getIdUser();
    //

    _pref.getPlantel().then((value) => (){
      setState(() {
        switch(value){
          case "Mante": position = 0; break;
          case "Matamoros": position = 1; break;
          case "Miguel Aleman": position = 2; break;
          case "Nuevo Laredo": position = 3; break;
          case "Rio Bravo": position = 4; break;
          case "Reynosa":position = 5; break;
          case "Tampico":position = 6; break;
          case "Victoria": position = 7; break;
          case "Cast Matamoros": position = 8; break;
          }
          // print("Value2: " + value);
      });
      // position = value;
    });

    // _pref.getIdUser().then((value) => (){
    //   setState(() {
    //     print("Value: " + value);
    //     idUser = "${value}";
    //   });
    // });

  }

  deleteUser(BuildContext context){
      Preferences _pref = Preferences();
      _pref.deleteUser(context);
  }

  int position = 0;

  // setUrl(int position){
  //   switch (position) {
  //     case 0: return 'https://plantelmante.firebaseapp.com/';
  //     case 1: return 'https://plantelmatamoros.firebaseapp.com/';
  //     case 2: return 'https://plantelmiguel.firebaseapp.com/';
  //     case 3: return 'https://plantelnuevolaredo.firebaseapp.com/';
  //     case 4: return 'https://plantelriobravo.firebaseapp.com/';
  //     case 5: return 'https://plantelreynosa.firebaseapp.com/';
  //     case 6: return 'https://planteltampico.firebaseapp.com/';
  //     case 7: return 'https://plantelvictoria.firebaseapp.com/';
  //     case 8: return 'https://castmatamoros.firebaseapp.com/';
  //   }
  //
  // }



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home:  new Scaffold(
        appBar: AppBar(
          title: Text(_setTextAppBar(select_drawer)),
          actions: <Widget>[
              IconButton(
                icon: Image.asset("assets/iconos_tutorial/ic_chat.png"),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Chat(position),
                  ));
                },
              ),

          ],
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              children: <Widget>[
                Material(
                    child: Center(
                      child: Container(
                        child: Image.asset(
                          'assets/images/logo_app.png',
                          height: 100,
                        ),
                      ),
                    )),

                ListTile(
                  leading: Image.asset('assets/iconos_menu/icon_home.png',width: size_icon, height: size_icon,),
                  title: Text('Inicio'),
                  onTap: (){_onSelectItem(0);},
                ),
                ListTile(
                  leading: Image.asset('assets/iconos_menu/ic_puntero.png',width: size_icon, height: size_icon,),
                  title: Text('Mapa'),
                  onTap: (){_onSelectItem(1);},
                ),


                ListTile(
                  leading: Image.asset('assets/iconos_menu/icono360.png',width: size_icon, height: size_icon,),
                  title: Text('Conalep 360°'),
                  onTap: (){_onSelectItem(2);},
                ),

                ListTile(
                  leading: Image.asset('assets/iconos_menu/ic_settings.png',width: size_icon, height: size_icon,),
                  title: Text('Ajustes'),
                  onTap: (){_onSelectItem(3);},
                ),

                ListTile(
                  leading: Image.asset('assets/iconos_menu/ic_info.png',width: size_icon, height: size_icon,),
                  title: Text('Politica de privacidad'),
                  onTap: (){
                    _onSelectItem(4);
                  },
                ),

                ListTile(
                  leading: Image.asset('assets/iconos_menu/ic_logout.png',width: size_icon, height: size_icon,),
                  title: Text("Cerrar Sesión"),
                  onTap: (){
                    deleteUser(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: _getDrawerItemWidget(select_drawer),
      ),
      theme: ThemeData(

        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.green.shade900,
        accentColor: Colors.green.shade800,

      ),
    );

  }


}
