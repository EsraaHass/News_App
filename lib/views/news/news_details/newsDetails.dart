import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/view_models/news_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../settings/provider.dart';

class NewsDetails extends StatefulWidget {
  static const String routeName = 'NewsDetails';

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late NewsDetailsViewModel newsDetailsViewModel;

  @override
  void initState() {
    super.initState();
    newsDetailsViewModel = NewsDetailsViewModel();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    var articles = ModalRoute.of(context)!.settings.arguments as Articles;
    var mediaQuery = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => newsDetailsViewModel,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(45))),
          toolbarHeight: 80,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.details,
          ),
          backgroundColor: provider.isDark() ? Colors.black : Colors.green,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(articles.author ?? ""),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(articles.title ?? ""),
                    SizedBox(
                      height: mediaQuery * .04,
                    ),
                    Text(
                      articles.content ?? "",
                      style: TextStyle(
                        color: Color(0xFF42505C),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    lunch(articles.url!);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(AppLocalizations.of(context)!.view,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 16,
                                  color: provider.isDark()
                                      ? Color(0xFF42505C)
                                      : Colors.green)),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: provider.isDark()
                            ? Color(0xFF42505C)
                            : Colors.green,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  // void launchURL(String link) async {
  void lunch(String link) {
    newsDetailsViewModel.launchURL(link);
  }
}
