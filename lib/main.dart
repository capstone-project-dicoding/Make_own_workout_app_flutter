import 'package:flutter/material.dart';
import 'package:make_own_workout/common/utils.dart';
import 'package:make_own_workout/main_page.dart';
import 'package:make_own_workout/onboarding_screen.dart';

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
      home: const OnboardingScreen(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings route) {
        switch (route.name) {
          case '/main':
            return MaterialPageRoute(builder: (_) => const 
      MainPage());
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
