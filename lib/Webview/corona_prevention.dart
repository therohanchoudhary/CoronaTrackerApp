import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CoronaPrevention extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CoronaPrevention();
  }
}

class _CoronaPrevention extends State<CoronaPrevention> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFEB3B),
          title: Text(
            'COVID-19 Prevention',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
      body: WebView(
        initialUrl:
        'https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}