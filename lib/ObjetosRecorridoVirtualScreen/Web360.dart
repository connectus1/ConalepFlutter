
import 'dart:async';

import 'package:Conalep360/PreferencesClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web360 extends StatefulWidget{
  @override
  WebState createState() => WebState();
}

class WebState extends State<Web360>{

  int position = 0;
  setUrl(int position){

    switch (position) {
      case 0: return 'https://plantelmante.firebaseapp.com/';
      case 1: return "https://plantelmatamoros.firebaseapp.com/";
      case 2: return "https://plantelmiguel.firebaseapp.com/";
      case 3: return "https://plantelnuevolaredo.firebaseapp.com/";
      case 4: return "https://plantelriobravo.firebaseapp.com/";
      case 5: return "https://plantelreynosa.firebaseapp.com/";
      case 6: return "https://planteltampico.firebaseapp.com/";
      case 7: return "https://plantelvictoria.firebaseapp.com/";
      case 8: return "https://castmatamoros.firebaseapp.com/";
    }

  }

  @override
  void initState() {
    Preferences _pref = Preferences();
    _pref.indexPlantel().then((value) => (){
        position = value;
    });

  }

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: setUrl(position),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }



}
