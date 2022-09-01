import 'package:flutter/material.dart';
import 'package:news_app/presentation_layer/categories/categoryWidget.dart';

import 'categoryModel.dart';

class CategoryFragment extends StatelessWidget {
  Function onCategoryClick;

  CategoryFragment(this.onCategoryClick);

  var category = BuildCategory.getAllCategoreies();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.transparent,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                onCategoryClick(category[index]);
              },
              child: CategoryWidget(category[index], index));
        },
        itemCount: category.length,
      ),
    );
  }
}
