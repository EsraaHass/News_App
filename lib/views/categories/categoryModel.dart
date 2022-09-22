import 'package:flutter/material.dart';

class BuildCategory {
  String? id;

  String? title;

  Color? color;

  String? imageUrl;

  BuildCategory(this.id, this.title, this.color, this.imageUrl);

  static List<BuildCategory> getAllCategoreies() {
    return [
      BuildCategory('sports', 'Sports', Color(0xFFC91C22), 'sports'),
      BuildCategory('business', 'Business', Color(0xFFCF7E48), 'business'),
      BuildCategory('general', 'General', Color(0xFF003E90), 'general'),
      BuildCategory('health', 'Health', Color(0xFFED1E79), 'health'),
      BuildCategory('science', 'Science', Color(0xFFF2D352), 'science'),
      BuildCategory(
          'technology', 'Technology', Color(0xFF4882CF), 'technology'),
    ];
  }
}
