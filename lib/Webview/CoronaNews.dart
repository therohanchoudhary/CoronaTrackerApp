import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class CoronaNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CoronaNews();
  }
}

class _CoronaNews extends State<CoronaNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFEB3B),
          title: Text(
            'COVID-19 News',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
      body: WebView(
        initialUrl:
        'https://www.google.com/search?sxsrf=ALeKk017YiqKQJAFLiHuhDsBBLoHS4LRKw%3A1592985528562&ei=uAfzXujhIcf8rQGDgaGgAg&q=covid+19+news&oq=covid+19+news&gs_lcp=CgZwc3ktYWIQAzIHCCMQsQIQJzIECAAQCjIECAAQCjIECAAQCjIECAAQCjIECAAQCjIECAAQCjIECAAQCjIECAAQCjIECAAQCjoECAAQR1C6MljjM2DcNGgAcAF4AIABlAGIAZQBkgEDMC4xmAEAoAEBqgEHZ3dzLXdpeg&sclient=psy-ab&ved=0ahUKEwjonb_E_ZnqAhVHfisKHYNACCQQ4dUDCAs&uact=5',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}