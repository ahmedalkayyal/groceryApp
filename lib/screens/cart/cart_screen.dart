import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/cart/cart_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/utils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Cart',
          color: color,
          textSize: 18,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyBroken.delete,
              color: color,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Material(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextWidget(
                              text: 'Order Now', color: Colors.white, textSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return const CartWidget();
                }),
          ),
        ],
      ),
    );
  }
}
