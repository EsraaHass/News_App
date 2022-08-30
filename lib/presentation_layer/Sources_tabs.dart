import 'package:flutter/material.dart';
import 'package:news_app/api/model/SoursesRespons.dart';
import 'package:news_app/presentation_layer/sourceTab.dart';

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
    return DefaultTabController(
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
          ],
        ));
  }
}
