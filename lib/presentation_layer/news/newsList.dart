import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/api/model/SoursesRespons.dart';
import 'package:news_app/presentation_layer/news/newsWidget.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(source.id!),
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
