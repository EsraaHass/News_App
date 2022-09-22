import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:news_app/repository/repository.dart';
import 'package:news_app/views/constant/constant.dart';

class NewsRepository implements Repository {
  @override
  Future<NewsResponse> getNewsBySourceId(
      {String? search, String? sourceId}) async {
    var url = Uri.https(BASE_URL, '/v2/everything', {
      'apiKey': API_KEY,
      'sources': sourceId,
      'q': search,
    });
    var getResponse = await http.get(url);
    var responseBody = getResponse.body;
    var json = jsonDecode(responseBody);
    var sourceResponse = NewsResponse.fromJson(json);
    return sourceResponse;
  }

  @override
  Future<SoursesRespons> getNewsSource(String categoryId) async {
    var url = Uri.https(BASE_URL, '/v2/top-headlines/sources',
        {'apiKey': API_KEY, 'category': categoryId});
    var getResponse = await http.get(url);
    var responseBody = getResponse.body;
    var json = jsonDecode(responseBody);
    var sourceResponse = SoursesRespons.fromJson(json);
    return sourceResponse;
  }
}
