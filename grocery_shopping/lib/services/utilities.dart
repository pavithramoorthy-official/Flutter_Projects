import 'package:flutter/material.dart';
import 'package:grocery_shopping/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utilities {
  BuildContext context;
  Utilities(this.context);
  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(context).size;
}
