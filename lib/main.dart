import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/navigation.dart';
import 'package:make_own_workout/common/utils.dart';
import 'package:make_own_workout/data/api/api_service.dart';
import 'package:make_own_workout/data/db/db_helper.dart';
import 'package:make_own_workout/model/mow_model.dart';
import 'package:make_own_workout/preferences/preferences_helper.dart';
import 'package:make_own_workout/presentation/detail_page.dart';
import 'package:make_own_workout/presentation/main_page.dart';
import 'package:make_own_workout/presentation/splash_page.dart';
import 'package:make_own_workout/provider/db_provider.dart';
import 'package:make_own_workout/provider/mow_provider.dart';
import 'package:make_own_workout/provider/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListMOWProvider(apiService: ApiService(http.Client())),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(dbHelper: DBHelper()),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, state, _) {
          return MaterialApp(
            title: 'Make Own Workout',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            builder: (context, child) {
              return CupertinoTheme(
                data: CupertinoThemeData(
                  brightness:
                      state.isDarkTheme ? Brightness.dark : Brightness.light,
                ),
                child: Material(
                  child: child,
                ),
              );
            },
            navigatorKey: navigatorKey,
            initialRoute: SplashPage.routeName,
            routes: {
              SplashPage.routeName: (context) => const SplashPage(),
              MainPage.routeName: (context) => const MainPage(),
              DetailPage.routeName: (context) => DetailPage(
                  mow: ModalRoute.of(context)?.settings.arguments as Data),
            },
            navigatorObservers: [routeObserver],
            // onGenerateRoute: (RouteSettings route) {
            //   switch (route.name) {
            //     case '/main':
            //       return MaterialPageRoute(builder: (_) => const MainPage());
            //     case SplashPage.routeName:
            //       return MaterialPageRoute(builder: (_) => const SplashPage());
            //     case DetailPage.routeName:
            //       return MaterialPageRoute(
            //         builder: (_) => DetailPage(
            //           mow: ModalRoute.of(context)?.settings.arguments as Data,
            //         ),
            //       );
            //     default:
            //       return MaterialPageRoute(builder: (_) {
            //         return const Scaffold(
            //           body: Center(
            //             child: Text('Page not found :('),
            //           ),
            //         );
            //       });
            //   }
            // },
          );
        },
      ),
    );
  }
}
