import 'package:flutter/material.dart';
import 'package:news_app/api/model/NewsResponse.dart';

class NewsWidget extends StatelessWidget {
  Articles articles;

  NewsWidget(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            articles.urlToImage ?? "",
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
          ),
          Text(articles.author ?? ""),
          Text(articles.title ?? ""),
          Text(articles.publishedAt ?? ""),
        ],
      ),
    );
  }
}
