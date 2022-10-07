import 'package:flutter/material.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:provider/provider.dart';

import '../../settings/provider.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool selectedTab;

  SourceTab(this.source, this.selectedTab);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: provider.isDark()
              ? (selectedTab ? Colors.black : Colors.transparent)
              : (selectedTab ? Colors.green : Colors.transparent),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: provider.isDark() ? Colors.black : Colors.green,
              width: 2)),
      child: Text(
        source.name ?? "",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: provider.isDark()
                ? (selectedTab ? Colors.white : Colors.black)
                : (selectedTab ? Colors.white : Colors.green)),
      ),
    );
  }
}
