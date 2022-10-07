import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/NewsRepositpry.dart';
import 'package:news_app/view_models/news_viewModel.dart';
import 'package:news_app/views/news/source/newsWidget.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(
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
        icon: const Icon(
          Icons.clear,
          size: 30,
        ));
  }

  NewsDetailsViewModel newsDetailsViewModel = NewsDetailsViewModel(
    repository: NewsRepository(),
  );

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsDetailsViewModel.getNewsBySourceId(search: query),
        builder: (buildContext, snapShot) {
          if (snapShot.hasError) {
            return Center(child: Text('${snapShot.error.toString()}'));
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
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
            ?.copyWith(color: const Color(0xFF303030)),
      ),
    );
  }
}
