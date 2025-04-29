import 'package:flutter/material.dart';
import 'package:grocery_shopping/services/dark_theme_preferences.dart';

//ChangeNotifier listens for changes
class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;
  set setDarkThemeProvider(bool setDarkTheme) {
    _darkTheme = setDarkTheme;
    darkThemePreference.setDarkThemePreference(setDarkTheme);
    notifyListeners();
    //notifyListeners will tell ChangeNotifier that something is changed
  }
}
