import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/presentation_layer/news/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (_) => HomeScreen()},
      theme: MyTheme.lightTheme,
    );
  }
}
