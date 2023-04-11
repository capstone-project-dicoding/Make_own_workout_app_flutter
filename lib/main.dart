import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/navigation.dart';
import 'package:make_own_workout/common/utils.dart';
import 'package:make_own_workout/data/api/api_service.dart';
import 'package:make_own_workout/data/api/auth_service.dart';
import 'package:make_own_workout/data/db/db_helper.dart';
import 'package:make_own_workout/model/mow_model.dart';
import 'package:make_own_workout/preferences/preferences_helper.dart';
import 'package:make_own_workout/presentation/account_page.dart';
import 'package:make_own_workout/presentation/detail_page.dart';
import 'package:make_own_workout/presentation/favorite_page.dart';
import 'package:make_own_workout/presentation/main_page.dart';
import 'package:make_own_workout/presentation/onboarding_page.dart';
import 'package:make_own_workout/presentation/search_page.dart';
import 'package:make_own_workout/presentation/signin_page.dart';
import 'package:make_own_workout/presentation/signup_page.dart';
import 'package:make_own_workout/presentation/splash_page.dart';
import 'package:make_own_workout/presentation/welcome_page.dart';
import 'package:make_own_workout/provider/db_provider.dart';
import 'package:make_own_workout/provider/mow_provider.dart';
import 'package:make_own_workout/provider/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'presentation/getstarted_page.dart';


int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);

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
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (newContext) => newContext.read<AuthService>().authStateChanges, initialData: [],
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
              WelcomePage.routeName: (context) => const WelcomePage(),
              AuthWrapper.routeName: (context) => const AuthWrapper(),
              GetStartedPage.routeName: (context) => const GetStartedPage(),
              OnboardingPage.routeName: (context) => const OnboardingPage(),
              SigninPage.routeName: (context) => const SigninPage(),
              SignupPage.routeName: (context) => const SignupPage(),
              MainPage.routeName: (context) => const MainPage(),
              DetailPage.routeName: (context) => DetailPage(
                  mow: ModalRoute.of(context)?.settings.arguments as Data),
              FavoritePage.routeName: (context) => const FavoritePage(),
              SearchPage.routeName: (context) => const SearchPage(),
              AccountPage.routeName: (context) => const AccountPage(),
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
