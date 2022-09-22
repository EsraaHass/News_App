import 'package:flutter/material.dart';
import 'package:news_app/model/SoursesRespons.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool selectedTab;

  SourceTab(this.source, this.selectedTab);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: selectedTab ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.green, width: 2)),
      child: Text(
        source.name ?? "",
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: selectedTab ? Colors.white : Colors.green),
      ),
    );
  }
}
