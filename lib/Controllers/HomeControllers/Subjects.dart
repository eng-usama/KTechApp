import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SubjectsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  WebView(
        initialUrl: 'https://ss.k-tech.edu.kw',
        //https://flutter.io
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
