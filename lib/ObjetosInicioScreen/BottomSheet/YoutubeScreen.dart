import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeScreen extends StatefulWidget{
  @override
  YoutubeState createState() => YoutubeState();
}

class YoutubeState extends State<YoutubeScreen>{
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return  WebView(
      initialUrl: "https://www.youtube.com/user/CONALEPON",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }

}