import 'package:flutter/material.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:news_app/views/news/search/newsList.dart';
import 'package:news_app/views/news/source/sourceTab.dart';

class SourcesTabs extends StatefulWidget {
  List<Source>? sources;

  SourcesTabs(this.sources);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: widget.sources!.length,
          child: Column(
            children: [
              TabBar(
                tabs: widget.sources!.map((source) {
                  bool isSelected =
                      widget.sources?.indexOf(source) == currentIndex;
                  return SourceTab(source, isSelected);
                }).toList(),
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
              ),
              NewsList(widget.sources![currentIndex]),
            ],
          )),
    );
  }
}
