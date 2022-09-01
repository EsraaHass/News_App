import 'package:flutter/material.dart';
import 'package:news_app/presentation_layer/categories/categoryModel.dart';

class CategoryWidget extends StatelessWidget {
  BuildCategory category;
  int index;

  CategoryWidget(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(index % 2 == 0 ? 18 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 18),
          ),
          color: category.color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/${category.imageUrl}.png',
              fit: BoxFit.fitHeight,
              height: 120,
            ),
            Text(
              category.title!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
  }
}
