// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:grocery_shopping/services/Utilities.dart';
import 'package:grocery_shopping/widgets/categories_widget.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  List<Color> gridColor = [
    const Color.fromARGB(255, 177, 94, 83),
    const Color(0xff53B175),
    const Color.fromARGB(255, 177, 175, 83),
    const Color.fromARGB(255, 177, 158, 83),
    const Color.fromARGB(255, 83, 177, 169),
    const Color.fromARGB(255, 177, 175, 83),
  ];

  List<Map<String, dynamic>> categoriesInfo = [
    {
      'imagepath': 'assets/images/categories/fruits.jpeg',
      'label': 'Fruits',
    },
    {
      'imagepath': 'assets/images/categories/vegetables.jpeg',
      'label': 'Vegetables',
    },
    {
      'imagepath': 'assets/images/categories/spinach.jpeg',
      'label': 'Herbs',
    },
    {
      'imagepath': 'assets/images/categories/nuts.jpeg',
      'label': 'Nuts',
    },
    {
      'imagepath': 'assets/images/categories/spices.jpeg',
      'label': 'Spices',
    },
    {
      'imagepath': 'assets/images/categories/grains.jpeg',
      'label': 'Grains',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final utilities = Utilities(context);
    Color categoriesAppbarColor = utilities.color;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(
          text: "Categories",
          color: categoriesAppbarColor,
          textSize: 24,
          isTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              categoriesLabel: categoriesInfo[index]['label'],
              categoriesImagePath: categoriesInfo[index]['imagepath'],
              categoriesColor: gridColor[index],
            );
          }),
        ),
      ),

      // body: Center(
      //   child: CategoriesWidget(),
      // ),
    );
  }
}
