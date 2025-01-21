// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/provider/dark_theme_provider.dart';
import 'package:grocery_shopping/providers/cart_providers.dart';
import 'package:grocery_shopping/screens/cart/cart_screen.dart';
import 'package:grocery_shopping/screens/categories.dart';
import 'package:grocery_shopping/screens/home_screen.dart';
import 'package:grocery_shopping/screens/user.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const routeName = '/BottomBarScreen';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    const HomeScreen(),
    CategoriesScreen(),
    const CartScreen(),
    const UserScreen()
  ];
  /* final List<Map<String, dynamic>> _screens = [
    {'page': const HomeScreen(), 'title': 'Home'},
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page': const CartScreen(), 'title': 'Cart'},
    {'page': const UserScreen(), 'title': 'User'}
  ];*/

  void _SelectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Color color = Utilities(context).color;
    bool isDark = themeState.getDarkTheme;

    //final cartProvidersObject = Provider.of<CartProviders>(context); insted of this we use consumer widget

    return Scaffold(
      /*appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),*/
      body: _screens[
          _selectedScreenIndex], //_screens[_selectedScreenIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: isDark
              ? Theme.of(context).cardColor
              : Colors.white, //Colors.purpleAccent.shade200,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: isDark ? Colors.white12 : Colors.black26,
          selectedItemColor:
              isDark ? Colors.lightBlueAccent.shade200 : Colors.black87,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedScreenIndex,
          onTap: _SelectedScreen,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(_selectedScreenIndex == 0
                  ? IconlyBold.home
                  : IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedScreenIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Consumer<CartProviders>(builder: (_, mycart, ch) {
                return badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -8, end: -8),
                  badgeAnimation: const badges.BadgeAnimation.slide(
                      // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                      // curve: Curves.easeInCubic,
                      ),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: color,
                  ),
                  badgeContent: FittedBox(
                    child: Text(
                      mycart.getCartItems.length.toString(),
                      style: TextStyle(
                          color: isDark ? Colors.black : Colors.white),
                    ),
                  ),
                  child: Icon(_selectedScreenIndex == 2
                      ? IconlyBold.buy
                      : IconlyLight.buy),
                );
              }),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedScreenIndex == 3
                  ? IconlyBold.user2
                  : IconlyLight.user2),
              label: "User",
            ),
          ]),
    );
  }
}
