import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatelessWidget {
  final String url;

  const ArticleScreen({super.key, required this.url});

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App")),
      body: Center(
        child: GestureDetector(
          onTap: _launchUrl,
          child: Container(
            padding: EdgeInsets.all(12),
            color: Colors.blue,
            child: Text(
              "افتح الرابط",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
