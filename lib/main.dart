import 'package:flutter/material.dart';
import 'package:news_app/views/constant/my_theme.dart';
import 'package:news_app/views/news/news_details/homeScreen.dart';
import 'package:news_app/views/news/news_details/newsDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetails.routeName: (_) => NewsDetails(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
