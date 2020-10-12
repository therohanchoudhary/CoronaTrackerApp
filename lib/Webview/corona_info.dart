import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CoronaInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CoronaInfo();
  }
}

class _CoronaInfo extends State<CoronaInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFEB3B),
          title: Text(
            'COVID-19',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
      body: WebView(
        initialUrl: 'https://www.who.int/health-topics/coronavirus#tab=tab_1',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}