import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:news_app/repository/NewsRepositpry.dart';
import 'package:news_app/view_models/news_viewModel.dart';
import 'package:news_app/views/news/search/newsWidget.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  NewsDetailsViewModel newsDetailsViewModel = NewsDetailsViewModel(
    repository: NewsRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsDetailsViewModel.getNewsBySourceId(sourceId: source.id!),
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
          var sources = data?.articles;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return NewsWidget(sources![index]);
              },
              itemCount: data?.articles?.length,
            ),
          );
        },
      ),
    );
  }
}
