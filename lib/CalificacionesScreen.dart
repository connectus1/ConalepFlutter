import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalificacionesScreen extends StatefulWidget{
  @override
  CalificacionesState createState()  => CalificacionesState();
}

class CalificacionesState extends State<CalificacionesScreen>{
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "http://alumno.conalep.edu.mx:38383/saac/home/perfil/",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }

}
