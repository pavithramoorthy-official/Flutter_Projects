// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:grocery_shopping/inner_screens/category_screen.dart';
import 'package:grocery_shopping/provider/dark_theme_provider.dart';
//import 'package:grocery_shopping/screens/categories.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.categoriesLabel,
    required this.categoriesImagePath,
    required this.categoriesColor,
  });

  final String categoriesLabel, categoriesImagePath;
  final Color categoriesColor;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryScreen.routeName,
            arguments: categoriesLabel);
      },
      child: Container(
        height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: categoriesColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: categoriesColor.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: _screenWidth * 0.3,
                width: _screenWidth * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      categoriesImagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(
              categoriesLabel,
              style: TextStyle(
                color: color,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
