import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:news_app/repository/repository.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsViewModel extends ChangeNotifier {
  Repository? repository;

  NewsDetailsViewModel({this.repository});

  void launchURL(String link) async {
    var uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<SoursesRespons> fetchNewsSource(String categoryId) async {
    var source = await repository!.getNewsSource(categoryId);
    return source;
  }

  Future<NewsResponse> getNewsBySourceId(
      {String? search, String? sourceId}) async {
    var news =
        await repository!.getNewsBySourceId(search: search, sourceId: sourceId);

    return news;
  }
}
