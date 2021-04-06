import 'package:Conalep360/ObjectsNoticia/ListViewNoticias.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'ObjectsNoticia/Noticia.dart';
import 'PreferencesClass.dart';

DatabaseReference ref;

class NoticiaScreen extends StatefulWidget{
  @override
  NoticiaState createState() => NoticiaState();

}
class NoticiaState extends State<NoticiaScreen>{
  String plantel;
  ListViewNoticia _noticias = new ListViewNoticia();

  @override
  void initState() {
    _loadData();
  }

  _loadData() async {
    Preferences _pref = Preferences();
    plantel = await _pref.getPlantel();
    setState(() {
      urlDatabase = setUrl(plantel);
    });

  }
  setUrl(String data){
    switch (data) {
      case "Mante": return 'https://conalep360-mante.firebaseio.com/';
      case "Matamoros":  return 'https://conalep360-matamoros.firebaseio.com/';
      case "Miguel Aleman": return 'https://conalep360-miguelaleman.firebaseio.com/';
      case "Nuevo Laredo": return 'https://conalep360-nuevolaredo.firebaseio.com/';
      case "Rio Bravo": return 'https://conalep360-reynosa.firebaseio.com/';
      case "Reynosa": return 'https://conalep360-riobravo.firebaseio.com/';
      case "Tampico": return 'https://conalep360-tampico.firebaseio.com/';
      case "Victoria": return 'https://conalep360-victoria.firebaseio.com/';
      case "Cast Matamoros": return 'https://conalep360-cast.firebaseio.com/';
    }
  }

  _getNoticias() {
    ref.child("noticias").once().then((DataSnapshot data) {
      if (data.value != null) {
        Map<dynamic, dynamic> map = data.value;

        for (int i = 0; i < map.length; i++) {
          Noticia noticia = new Noticia(
            fecha: map.values.toList()[i]['fecha'],
            titulo: map.values.toList()[i]['titulo'],
            noticia: map.values.toList()[i]['descripcion'],
            url: map.values.toList()[i]['urlAlmacenamiento'],
          );

          _noticias.addNoticia(noticia);
          // if (noticia.compareTo(nivel) == 0 ||
          //     (noticia.nivel.compareTo("Kínder") == 0 &&
          //         nivel.compareTo("Kinder") == 0)) {
          //   if (noticia.grado.compareTo(grado) == 0 ||
          //       noticia.grado.compareTo("General") == 0) {
          //     if (noticia.grupo.compareTo(grupo) == 0 ||
          //         noticia.grupo.compareTo("General") == 0) {
          //
          //     }
          //   }
          // }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref = FirebaseDatabase(databaseURL: urlDatabase).reference();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    _getNoticias();

    return ListViewNoticia();
  }

}