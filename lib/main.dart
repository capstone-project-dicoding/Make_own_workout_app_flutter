import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/common/utils.dart';
import 'package:make_own_workout/presentation/main_page.dart';
import 'package:make_own_workout/presentation/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Make Own App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: kTextTheme,
      ),
      home: const SplashPage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings route) {
        switch (route.name) {
          case '/main':
            return MaterialPageRoute(builder: (_) => const MainPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}
