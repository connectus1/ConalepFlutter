import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp(MediaQuery.of(context).size.width * 0.6);
  }
}

//Esta clase se encarga de la pantalla que se muestra al usuario
class MyApp extends MaterialApp {
  double width;

  MyApp(double width) {
    this.width = width;
  }

  //El titulo de la aplicacion
  @override
  String get title => "Titulo de la aplicacion";

  //utilizamos el widget Scaffold que modificamos sus parametros
  @override
  Widget get home => new Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
        ),
        drawer: Container(
          width: width,
          child: NavigationDrawer(),
        ),
        body:
        Center(
          child: Text("Hola Mundo"),
        ),

      );

  //El tema de la aplicacion
  @override
    ThemeData get theme => ThemeData(
    // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.green.shade900,
      accentColor: Colors.green.shade800,

      // Define the default font family.
      // fontFamily: 'Georgia',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      // textTheme: TextTheme(
      //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // ),
  );

}

class NavigationDrawer extends Drawer {
  @override
  Widget get child => ListView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        children: <Widget>[
          Material(
              child: Center(
            child: Container(
              child: Image.asset(
                'assets/images/logo_app.png',
                height: 140,
              ),
            ),
          )),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Inicio'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Mapa'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Conalep 360°'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Informacion'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ajustes'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Politica de privacidad'),
          ),
        ],
      );
}
