import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/presentation_layer/news/my_date_utiles.dart';

class NewsWidget extends StatelessWidget {
  Articles articles;

  NewsWidget(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 230,
              width: double.infinity,
              imageUrl: articles.urlToImage ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(articles.author ?? ""),
          const SizedBox(
            height: 5,
          ),
          Text(articles.title ?? ""),
          SizedBox(
            height: 5,
          ),
          Text(
              textAlign: TextAlign.end,
              MyDateUtiles.formatNewsFormat(articles.publishedAt ?? "")),
        ],
      ),
    );
  }
}
