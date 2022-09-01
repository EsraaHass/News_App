import 'package:flutter/material.dart';
import 'package:news_app/presentation_layer/categories/categories.dart';
import 'package:news_app/presentation_layer/homeSideMinue.dart';
import 'package:news_app/presentation_layer/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'News App',
          ),
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(
          child: HomeSideMinue(onSideMenueButtonClick),
        ),
        body: currentWidget,
      ),
    );
  }

  Widget currentWidget = CategoryFragment();

  void onSideMenueButtonClick(int type) {
    if (type == HomeSideMinue.category) {
      currentWidget = CategoryFragment();
    } else if (type == HomeSideMinue.settings) {
      currentWidget = SettingsFragment();
    }
    setState(() {});
    Navigator.pop(context);
  }
}
