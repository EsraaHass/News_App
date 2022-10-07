import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildCategory {
  String? id;

  String? title;

  Color? color;

  String? imageUrl;

  BuildCategory(this.id, this.title, this.color, this.imageUrl);

  static List<BuildCategory> getAllCategoreies(BuildContext context) {
    return [
      BuildCategory('sports', AppLocalizations.of(context)?.sports,
          Color(0xFFC91C22), 'sports'),
      // BuildCategory('entertainment', 'Entertainment', Color(0xFFCF7E48),'entertainment'),
      BuildCategory('general', AppLocalizations.of(context)?.general,
          Color(0xFF003E90), 'general'),
      BuildCategory('health', AppLocalizations.of(context)?.health,
          Color(0xFFED1E79), 'health'),
      BuildCategory('science', AppLocalizations.of(context)?.science,
          Color(0xFFF2D352), 'science'),
      // BuildCategory(
      //     'technology', 'Technology', Color(0xFF4882CF), 'technology'),
    ];
  }
}
