import 'package:flutter/material.dart';
import 'package:news_app/presentation_layer/categories/categories.dart';
import 'package:news_app/presentation_layer/categories/categoryModel.dart';
import 'package:news_app/presentation_layer/homeSideMinue.dart';
import 'package:news_app/presentation_layer/news/newsFragment.dart';
import 'package:news_app/presentation_layer/news/newsSearch.dart';
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(45))),
          toolbarHeight: 80,
          centerTitle: true,
          title: const Text(
            'News App',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  openPageSearch();
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                )),
          ],
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(
          child: HomeSideMinue(onSideMenueButtonClick),
        ),
        body: currentWidget,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentWidget = CategoryFragment(oncategoriesButtonClick);
  }

  late Widget currentWidget;

  void oncategoriesButtonClick(BuildCategory category) {
    currentWidget = NewsFragment(category);
    setState(() {});
  }

  void onSideMenueButtonClick(int type) {
    if (type == HomeSideMinue.category) {
      currentWidget = CategoryFragment(oncategoriesButtonClick);
    } else if (type == HomeSideMinue.settings) {
      currentWidget = SettingsFragment();
    }
    setState(() {});
    Navigator.pop(context);
  }

  void openPageSearch() {
    showSearch(context: context, delegate: NewsSearch());
  }
}
