import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;
  static const darkTheme = 'DARK_THEME';
  // static const DAILY_NEWS = 'DAILY_NEWS';

  PreferencesHelper({required this.sharedPreferences});

  // Dark Theme
  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  // Pengaturan schedule daily news
  // Future<bool> get isDailyNewsActive async {
  //   final prefs = await sharedPreferences;
  //   return prefs.getBool(DAILY_NEWS) ?? false;
  // }

  // void setDailyNews(bool value) async {
  //   final prefs = await sharedPreferences;
  //   prefs.setBool(DAILY_NEWS, value);
  // }
}