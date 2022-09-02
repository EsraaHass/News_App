import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/presentation_layer/news/newsWidget.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 30,
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          size: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(search: query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'Suggestions',
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Color(0xFF303030)),
      ),
    );
  }
}
