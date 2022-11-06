import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import 'heart_btn.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    final theme = Utils(context).getTheme;
    TextEditingController _quantityTextController=TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: SingleChildScrollView(
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                        height: size.height*0.22,
                        width: size.width*0.22,
                        imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                        boxFit: BoxFit.fill,

                      ),
                      Column(
                        children: [
                          TextWidget(color: color, text: '1KG', textSize: 18),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  IconlyLight.bag2,
                                  size: 22,
                                  color: color,
                                ),
                              ),
                              HeartBTN(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                   const PriceWidget(
                     isOnSale: true,
                     price: 5.9,
                     salePrice: 2.99,
                       textPrice:'1',//_quantityTextController.text,
                   ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextWidget(
                    text: 'Product Title',
                    color: color,
                    textSize: 16,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
