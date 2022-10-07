import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:news_app/repository/NewsRepositpry.dart';
import 'package:news_app/view_models/news_viewModel.dart';
import 'package:news_app/views/news/source/newsWidget.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int pageNumper = 1;
  bool atbottom = false;
  final scrollController = ScrollController();
  List<Articles> news = [];

  NewsDetailsViewModel newsDetailsViewModel = NewsDetailsViewModel(
    repository: NewsRepository(),
  );

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;

        if (!isTop) {
          atbottom = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (atbottom) {
      // call api again to get 20 items again.
      newsDetailsViewModel
          .getNewsBySourceId(sourceId: widget.source.id!, page: ++pageNumper)
          .then((newsResponse) {
        news.addAll(newsResponse.articles ?? []);
        atbottom = false;
        setState(() {});
      });
    }
    return FutureBuilder<NewsResponse>(
      future:
          newsDetailsViewModel.getNewsBySourceId(sourceId: widget.source.id!),
      builder: (buildContext, snapShot) {
        if (snapShot.hasError) {
          return Center(child: Text('${snapShot.error.toString()}'));
        } else if (snapShot.hasData) {
          var data = snapShot.data;

          if (news.isEmpty) {
            news = data!.articles ?? [];
          }
          if (news[0].title != data!.articles![0].title) {
            scrollController.jumpTo(0);
            news = data.articles ?? [];
          }

          return Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (_, index) {
                return NewsWidget(news[index]);
              },
              itemCount: news.length,
            ),
          );
        } else {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
