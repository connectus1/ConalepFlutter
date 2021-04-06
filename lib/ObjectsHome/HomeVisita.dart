import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ChatScreen.dart';
import '../GoogleMapScreen.dart';
import '../InicioScreen.dart';
import '../PoliticaDePrivacidadScreen.dart';
import '../PreferencesClass.dart';
import '../RecorridoVirtualScreen.dart';
import '../SettingsScreen.dart';

class HomeVisita extends StatefulWidget {
  @override
  VisitaState createState() => VisitaState();
}

class VisitaState extends State<HomeVisita> {
  int select_drawer = 0;
  double size_icon = 23;

  bool alumno = false;

  _getDrawerItemWidget(int position) {
    switch (position) {
      case 0:
        return InicioScreen();
      case 1:
        return GoogleMapScreen();
      case 2:
        return RecorridoVirtualScreen();
      case 3:
        return SettingScreen();
      case 4:
        return PoliticaDePrivacidadScreen();
    }
  }

  _setTextAppBar(int position) {
    switch (position) {
      case 0:
        return "Inicio";
      case 1:
        return "Mapa";
      case 2:
        return "Gem 360";
      case 3:
        return "Ajustes";
      case 4:
        return "Politica De Privacidad";
    }
  }

  _onSelectItem(position) {
    setState(() {
      select_drawer = position;
    });
  }

  @override
  void initState() {
    _getAlumno();
  }

  _getAlumno() async {
    Preferences _pref = Preferences();
    String data = await _pref.getType();

    if (data.compareTo("Alumnos") == 0)
      setState(() {
        alumno = true;
      });
  }

  deleteUser(BuildContext context) {
    Preferences _pref = Preferences();
    _pref.deleteUser(context);
  }

  int position = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text(_setTextAppBar(select_drawer)),
          actions: <Widget>[
            IconButton(
              icon: Image.asset("assets/iconos_tutorial/ic_chat.png"),
              onPressed: () {
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
                SizedBox(
                  height: 20,
                ),
                Material(
                    child: Center(
                  child: Container(
                    child: Image.asset(
                      'assets/images/logo_app.png',
                      height: 50,
                    ),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/iconos_menu/icon_home.png',
                    width: size_icon,
                    height: size_icon,
                  ),
                  title: Text('Inicio'),
                  onTap: () => _onSelectItem(0),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/iconos_menu/ic_puntero.png',
                    width: size_icon,
                    height: size_icon,
                  ),
                  title: Text('Mapa'),
                  onTap: () => _onSelectItem(1),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/iconos_menu/icono360.png',
                    width: size_icon,
                    height: size_icon,
                  ),
                  title: Text('Gem 360°'),
                  onTap: () => _onSelectItem(2),
                ),

                //---------------------
                //Seccion de politicas de la aplicacion
                //---------------------
                ListTile(
                  title: Text(
                    "Politicas",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                ListTile(
                  // contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Image.asset(
                    'assets/iconos_menu/ic_info.png',
                    width: size_icon,
                    height: size_icon,
                  ),
                  title: Text('Politica de privacidad'),
                  onTap: () => _onSelectItem(4),
                ),

                //---------------------
                //Seccion de configuracion
                //---------------------
                ListTile(
                  title: Text(
                    "Configuracion",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),

                ListTile(
                  leading: Image.asset(
                    'assets/iconos_menu/ic_logout.png',
                    width: size_icon,
                    height: size_icon,
                  ),
                  title: Text("Cerrar Sesión"),
                  onTap: () {
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
        primaryColor: Colors.blue.shade900,
        accentColor: Colors.blue.shade800,
      ),
    );
  }
}
