import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../settings/provider.dart';

class HomeSideMinue extends StatefulWidget {
  static const int category = 10;

  static const int settings = 20;

  Function itemcallBackFunction;

  HomeSideMinue(this.itemcallBackFunction);

  @override
  State<HomeSideMinue> createState() => _HomeSideMinueState();
}

class _HomeSideMinueState extends State<HomeSideMinue> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          height: 180,
          color: provider.isDark() ? Colors.black : Colors.green,
          child: Text(
            AppLocalizations.of(context)!.news_app,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        InkWell(
            onTap: () {
              widget.itemcallBackFunction(HomeSideMinue.category);
            },
            child: buildContainer(
              AppLocalizations.of(context)!.categories,
              Icon(
                Icons.list_rounded,
                size: 35,
              ),
            )),
        InkWell(
            onTap: () {
              provider.changeLang('en');
            },
            child: buildContainer(
              AppLocalizations.of(context)!.english,
              Icon(
                Icons.language,
                size: 35,
              ),
            )),
        InkWell(
            onTap: () {
              provider.changeLang('ar'); // provider.changeLang('en');
            },
            child: buildContainer(
              AppLocalizations.of(context)!.arabic,
              Icon(
                Icons.ac_unit_sharp,
                size: 35,
              ),
            )),
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: buildContainer(
              AppLocalizations.of(context)!.light,
              Icon(
                Icons.light_mode,
                size: 35,
              ),
            )),
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: buildContainer(
              AppLocalizations.of(context)!.dark,
              Icon(
                Icons.dark_mode,
                size: 35,
              ),
            )),
      ],
    );
  }

  Widget buildContainer(String text, Icon icon) {
    return Container(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 10, right: 20),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Color(0xFF303030), fontSize: 20),
            ),
          ],
        ));
  }

  showList() {
    showBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            child: Text('grg'),
          );
        });
  }
}
