import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getTheme();
    // _getDailyNewsPreferences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  // bool _isDailyNewsActive = false;
  // bool get isDailyNewsActive => _isDailyNewsActive;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  // void _getDailyNewsPreferences() async {
  //   _isDailyNewsActive = await preferencesHelper.isDailyNewsActive;
  //   notifyListeners();
  // }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  // void enableDailyNews(bool value) {
  //   preferencesHelper.setDailyNews(value);
  //   _getDailyNewsPreferences();
  // }
}