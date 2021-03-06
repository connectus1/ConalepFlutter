import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PoliticaDePrivacidadScreen extends StatefulWidget{
  @override
  PoliticaState createState()  => PoliticaState();
}

class PoliticaState extends State<PoliticaDePrivacidadScreen>{
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://sites.google.com/view/politicadeprivacidadconalep360/p%C3%A1gina-principal",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }

}
