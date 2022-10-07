import 'package:flutter/material.dart';
import 'package:news_app/model/SoursesRespons.dart';
import 'package:news_app/repository/NewsRepositpry.dart';
import 'package:news_app/view_models/news_viewModel.dart';
import 'package:news_app/views/categories/categoryModel.dart';
import 'package:news_app/views/news/source/Sources_tabs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../settings/provider.dart';

class NewsFragment extends StatelessWidget {
  BuildCategory category;
  NewsDetailsViewModel newsDetailsViewModel = NewsDetailsViewModel(
    repository: NewsRepository(),
  );
  late Future<SoursesRespons> sourcesResponse;

  NewsFragment(this.category);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        FutureBuilder<SoursesRespons>(
            future: newsDetailsViewModel.fetchNewsSource(category.id!),
            builder: (buildContext, snapShot) {
              if (snapShot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        AppLocalizations.of(context)!.internet,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<BeveledRectangleBorder>(
                            BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              provider.isDark() ? Colors.black : Colors.green),
                        ),
                        onPressed: () {
                          sourcesResponse = newsDetailsViewModel
                              .fetchNewsSource(category.id!);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.try_again,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapShot.data;
              if (data?.status == 'error') {
                return Center(child: Text('${data?.message}'));
              }
              var sources = data?.sources;
              return SourcesTabs(sources);
            }),
      ],
    );
  }
}
