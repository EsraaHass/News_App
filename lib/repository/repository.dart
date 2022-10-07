import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SoursesRespons.dart';

abstract class Repository {
  Future<NewsResponse> getNewsBySourceId(
      {String? search, String? sourceId, int? page});

  Future<SoursesRespons> getNewsSource(String categoryId);
}
