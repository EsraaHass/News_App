import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/views/constant/my_date_utiles.dart';
import 'package:news_app/views/news/news_details/newsDetails.dart';

class NewsWidget extends StatelessWidget {
  Articles articles;

  NewsWidget(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,
            arguments: articles);
      },
      child: Container(
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
            Text(
              articles.author ?? "",
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              articles.title ?? "",
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                textAlign: TextAlign.end,
                MyDateUtiles.formatNewsFormat(articles.publishedAt ?? "")),
          ],
        ),
      ),
    );
  }
}
