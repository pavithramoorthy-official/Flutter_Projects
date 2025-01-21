import 'package:flutter/material.dart';

class Styles {
  static ThemeData themedata(bool isDarktheme, BuildContext context) {
    //contex is used for button. if we dont give button theme, we dont have to give context
    return ThemeData(
      scaffoldBackgroundColor:
          isDarktheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarktheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
            brightness: isDarktheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarktheme
          ? const Color(0xFF0a0d2c)
          : const Color.fromARGB(255, 200, 248, 248),
      canvasColor: isDarktheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarktheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
