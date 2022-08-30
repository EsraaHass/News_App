import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/presentation_layer/Sources_tabs.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News App',
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: ApiManager.getNewsSource(),
              builder: (buildContext, snapShot) {
                if (snapShot.hasError) {
                  return Center(child: Text('${snapShot.error.toString()}'));
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var data = snapShot.data;
                if (data?.status == 'error') {
                  return Center(child: Text('${data?.message}'));
                }
                var sources = data?.sources;
                return SourcesTabs(sources);
                /*
               ListView.builder(
                     itemBuilder: (_,index){
                       return Text((sources![index].name) ?? '') ;
                     },
                 itemCount: sources?.length,
                 ),
                */
              }),
        ],
      ),
    );
  }
}
