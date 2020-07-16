import 'package:flutter/material.dart';
import 'package:flutter_app/src/provider_demo/homestate.dart';
import 'package:flutter_app/src/provider_demo/list_state.dart';
import 'package:flutter_app/src/provider_demo/screens/home_screen.dart';
import 'package:flutter_app/src/provider_demo/screens/list_screen.dart';
import 'package:provider/provider.dart';

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider demo',
      theme: ThemeData.dark(),
      onGenerateRoute: (settings) => routes(settings),
    );
  }

  Route routes(RouteSettings settings) {
    return settings.name == "/" ? homePage() : listScreen();
  }

  MaterialPageRoute homePage() {
    return MaterialPageRoute(builder: (_) {
      return ChangeNotifierProvider<HomeState>(
        builder: (_) => HomeState(),
        child: HomeScreen(),
      );
    });
  }

  MaterialPageRoute listScreen() {
    return MaterialPageRoute(builder: (_) {
      return ChangeNotifierProvider<ListState>(
        builder: (_) {
          ListState listState = ListState();
          listState.fetchData();
          return listState;
        },
        child: ListScreen(),
      );
    });
  }
}
