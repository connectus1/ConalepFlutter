import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TwitterScreen extends StatefulWidget{
  @override
  TwitterState createState() => TwitterState();
}

class TwitterState extends State<TwitterScreen>{
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return  WebView(
      initialUrl: "https://twitter.com/CONALEP_Mex",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }

}
