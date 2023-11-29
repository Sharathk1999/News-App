import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebViewScreen extends StatefulWidget {
  final String blogUrl;
  const ArticleWebViewScreen({super.key, required this.blogUrl});

  @override
  State<ArticleWebViewScreen> createState() => _ArticleWebViewScreenState();
}

class _ArticleWebViewScreenState extends State<ArticleWebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Hind'),
            ),
            Text(
              'App',
              style: TextStyle(color: Colors.black, fontFamily: 'Hind'),
            ),
          ],
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
