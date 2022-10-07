import 'package:flutter/material.dart';
import 'package:news_app/views/categories/categoryWidget.dart';

import 'categoryModel.dart';

class CategoryFragment extends StatelessWidget {
  Function onCategoryClick;

  CategoryFragment(this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    var category = BuildCategory.getAllCategoreies(context);
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.transparent,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
