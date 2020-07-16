import 'package:flutter/material.dart';
import 'package:flutter_app/src/api_demo/blocs/stories_provider.dart';
import 'screens/news_screen.dart';
import 'screens/news_detail.dart';

class ApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Api demo app',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(
        builder: (context) {
          return NewsScreen();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          final stringId = settings.name.replaceFirst('/', '');
          final int id = int.parse(stringId);
          return NewsDetail(
            itemId: id,
          );
        },
      );
    }
  }
}
