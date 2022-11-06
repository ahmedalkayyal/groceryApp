import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/categories_widget.dart';

import '../widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColor = [
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.pink,
    Colors.brown,
    Colors.purple
  ];

  List<Map<String, dynamic>> catInfo = [
    {'imgPath': 'assets/images/fruit.jpg', 'catText': 'Fruits'},
    {'imgPath': 'assets/images/veg.jpg', 'catText': 'vegetables'},
    {'imgPath': 'assets/images/herb.jpg', 'catText': 'Herbs'},
    {'imgPath': 'assets/images/nut.jpg', 'catText': 'Nuts'},
    {'imgPath': 'assets/images/spice.jpg', 'catText': 'Spices'},
    {'imgPath': 'assets/images/grain.jpg', 'catText': 'Grains'},
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
            text: 'Categories ', color: color, textSize: 22, isTitle: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              passedColor: gridColor[index],
              catText: catInfo[index]['catText'],
              imgPath: catInfo[index]['imgPath'],
            );
          }),
        ),
      ),
    );
  }
}
