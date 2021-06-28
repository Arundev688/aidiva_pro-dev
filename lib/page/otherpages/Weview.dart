import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget
{

  @override
  _Webview createState()=>new _Webview();


}

class _Webview extends State<Webview> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();


  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SafeArea(
      child: Scaffold(
        body: WebView(
            initialUrl: 'https://yallabasket.com/AboutusDetailsphone',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }
        ),
      ),
    );
  }



}