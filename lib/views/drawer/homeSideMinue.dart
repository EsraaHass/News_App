import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          height: 180,
          decoration: BoxDecoration(color: Colors.green),
          child: Text(
            'News App!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        InkWell(
            onTap: () {
              widget.itemcallBackFunction(HomeSideMinue.category);
            },
            child: buildContainer('Categories', 'images/icon_category.png')),
        InkWell(
            onTap: () {
              widget.itemcallBackFunction(HomeSideMinue.settings);
            },
            child: buildContainer('Settings', 'images/icon_settings.png')),
      ],
    );
  }

  Widget buildContainer(String text, String imageUrl) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Row(
        children: [
          ImageIcon(AssetImage(imageUrl)),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Color(0xFF303030),
                ),
          ),
        ],
      ),
    );
  }
}
