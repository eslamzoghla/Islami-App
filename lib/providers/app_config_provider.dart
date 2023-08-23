import 'package:flutter/material.dart';

class appConfigProvider extends ChangeNotifier {
  String appLanguage = 'ar';
  ThemeMode appTheme = ThemeMode.dark;
  void showAppLanguage(String newLanguage) {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    notifyListeners();
  }

  String getSelectedProviderLanguage() {
    if (appLanguage == 'en') {
      return 'English';
    }
    return 'العربيـه';
  }

  bool isDarkTheme() {
    return appTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode mode) {
    if (mode == appTheme) return;
    appTheme = mode;
    notifyListeners();
  }

  String getSelectedProviderTheme() {
    if (appTheme == ThemeMode.dark) {
      return 'Dark';
    }
    return 'Light';
  }
}
