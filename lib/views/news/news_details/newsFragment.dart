import 'package:flutter/material.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:news_app/repository/NewsRepositpry.dart';
import 'package:news_app/view_models/news_viewModel.dart';
import 'package:news_app/views/categories/categoryModel.dart';
import 'package:news_app/views/news/source/Sources_tabs.dart';

class NewsFragment extends StatelessWidget {
  BuildCategory category;

  NewsFragment(this.category);

  NewsDetailsViewModel newsDetailsViewModel = NewsDetailsViewModel(
    repository: NewsRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<SoursesRespons>(
            future: newsDetailsViewModel.fetchNewsSource(category.id!),
            builder: (buildContext, snapShot) {
              if (snapShot.hasError) {
                return Center(child: Text('${snapShot.error.toString()}'));
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapShot.data;
              if (data?.status == 'error') {
                return Center(child: Text('${data?.message}'));
              }
              var sources = data?.sources;
              return SourcesTabs(sources);
            }),
      ],
    );
  }
}
