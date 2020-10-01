import 'package:flutter/material.dart';
import 'package:flutter_authify_ui_app/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authify UI App',
      debugShowCheckedModeBanner: false,
      home: AnimatedLoginPage(),
    );
  }
}
