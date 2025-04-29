import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = 'THEME_STATUS';
  setDarkThemePreference(bool setThemeValue) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(THEME_STATUS, setThemeValue);
  }

  Future<bool> getThemePreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(THEME_STATUS) ?? false;
  }
}
