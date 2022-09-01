import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/api/model/SoursesRespons.dart';
import 'package:news_app/presentation_layer/categories/categoryModel.dart';

class ApiManager {
  static const API_KEY = '1a857ebff2674b71929900fabb8e3f56';
  static const BASE_URL = 'newsapi.org';

  static Future<SoursesRespons> getNewsSource(String categoryId) async {
    BuildCategory category;
    var url = Uri.https(BASE_URL, '/v2/top-headlines/sources',
        {'apiKey': API_KEY, 'category': categoryId});
    var getResponse = await http.get(url);
    var responseBody = getResponse.body;
    var json = jsonDecode(responseBody);
    var sourceResponse = SoursesRespons.fromJson(json);
    return sourceResponse;
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    var url = Uri.https(
        BASE_URL, '/v2/everything', {'apiKey': API_KEY, 'sources': sourceId});
    var getResponse = await http.get(url);
    var responseBody = getResponse.body;
    var json = jsonDecode(responseBody);
    var sourceResponse = NewsResponse.fromJson(json);
    return sourceResponse;
  }
}
//  google :  https://newsapi.org/docs/endpoints/everything
