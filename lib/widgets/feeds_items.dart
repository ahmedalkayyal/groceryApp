import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import '../services/utils.dart';
import 'heart_btn.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Material(
      color: Theme
          .of(context)
          .cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            FancyShimmerImage(
              height: size.height * 0.22,
              width: size.width * 0.2,
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              boxFit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Title',
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                  const HeartBTN(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Flexible(

              child: PriceWidget(
                isOnSale: true,
                price: 5.9,
                salePrice: 2.99,
                textPrice: _quantityTextController.text,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Row(
                children: [
                  FittedBox(
                    child: TextWidget(
                        isTitle: true,
                        text: 'KG',
                        color: color,
                        textSize: 22),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _quantityTextController,
                      key: const ValueKey('10'),
                      style: TextStyle(color: color, fontSize: 18),
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      enabled: true,
                      onChanged: (val) {
                        return setState(() {});
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9.]'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Spacer(),

      SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(Theme
                .of(context)
                .cardColor),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),),),),),
          child: TextWidget(
            text: 'Add to Cart',
            color: color,
            textSize: 18,
            maxLines: 1,
          ),
        ),
      ),
      ],
    ),)
    ,
    );
  }
}
