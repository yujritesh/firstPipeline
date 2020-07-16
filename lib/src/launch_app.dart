import 'package:flutter/material.dart';
import 'package:flutter_app/src/animation_demo/screens/animation_screen.dart';
import 'package:flutter_app/src/api_demo/blocs/stories_provider.dart';
import 'package:flutter_app/src/api_demo/screens/news_detail.dart';
import 'package:flutter_app/src/api_demo/screens/news_screen.dart';
import 'package:flutter_app/src/dashboard.dart';
import 'package:flutter_app/src/login_bloc_demo/screens/login_screen.dart';
import 'package:flutter_app/src/pics_demo/pics_screen.dart';

class LaunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      onGenerateRoute: (settings) {
        return routes(settings);
      },
    );
  }

  routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return gotoLoginScreen();
      case '/dashboard':
        return gotoDashboardScreen();
      case '/animation':
        return gotoAnimationScreen();
      case '/news':
        return gotoNewsScreen();
      case '/pics':
        return gotoPicsScreen();
      default:
        return analysePath(settings.name);
    }
  }

  Route gotoDashboardScreen() {
    return MaterialPageRoute(builder: (_) {
      return DashboardScreen();
    });
  }

  Route gotoLoginScreen() {
    return MaterialPageRoute(builder: (_) {
      return LoginScreen();
    });
  }

  Route gotoAnimationScreen() {
    return MaterialPageRoute(builder: (_) {
      return AnimationScreen();
    });
  }

  Route gotoNewsScreen() {
    return MaterialPageRoute(builder: (_) {
      return StoriesProvider(
        child: NewsScreen(),
      );
    });
  }

  Route gotoPicsScreen() {
    return MaterialPageRoute(builder: (_) {
      return PicsScreen();
    });
  }

  Route analysePath(String name) {
    String stringId = name.replaceAll('/', '');
    int id = int.parse(stringId);
    return MaterialPageRoute(builder: (_) {
      return NewsDetail(itemId: id);
    });
  }
}
