import 'dart:async';

import 'package:Conalep360/PreferencesClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FacebookScreen extends StatefulWidget{
  @override
  FacebookState createState() => FacebookState();
}

class FacebookState extends State<FacebookScreen>{
  String plantel = "Mante";
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    getPlantel();
  }

  getPlantel() async{
    Preferences _pref = Preferences();
    String aux = await _pref.getPlantel();
    setState(() {
      plantel = aux;
    });
  }

  String setUrl(String data){
    switch (data) {
      case "Mante": return 'https://www.facebook.com/conalepmante127/';
      case "Matamoros":  return 'https://www.facebook.com/pages/category/Junior-High-School/Conalep-Matamoros-132129713534959/?locale2=es_LA';
      case "Miguel Aleman": return 'https://www.facebook.com/pages/category/Education/Conalep-Plantel-Miguel-Aleman-1068263846524060/?locale2=es_LA';
      case "Nuevo Laredo": return 'https://www.facebook.com/pages/category/Computer-Training-School/conalep-246-135056449928615/?locale2=es_LA';
      case "Rio Bravo": return 'https://www.facebook.com/conaleprb/?locale2=es_LA';
      case "Reynosa": return 'https://www.facebook.com/pages/category/Education/Conalep-Reynosa-680412778723814/?locale2=es_LA';
      case "Tampico": return 'https://www.facebook.com/TampicoConalep/';
      case "Victoria": return 'https://www.facebook.com/ConalepVictoria172/?locale2=es_LA';
      case "Cast Matamoros": return 'https://www.facebook.com/CASTMATAMOROS2019/';
    }
  }

  @override
  Widget build(Object context) {
    return WebView(
      initialUrl: setUrl(plantel),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }

}