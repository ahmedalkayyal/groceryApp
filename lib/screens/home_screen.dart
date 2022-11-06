import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner_screen/feeds_screen.dart';
import 'package:grocery_app/services/global_method.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/feeds_items.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../inner_screen/on_sale_sceen.dart';
import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImag = [
    'assets/images/offer1.png',
    'assets/images/offer2.jpg',
    'assets/images/offer3.png',
    'assets/images/offer4.png',
  ];

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    //GlobalMethod _globalMethod=GlobalMethod();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Center(
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      _offerImag[index],
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: _offerImag.length,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red),
                  ),
                  //  control: const SwiperControl(color: Colors.amber),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethod.navigateTo(
                    context: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                color: Colors.blue,
                text: 'View All',
                textSize: 18,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On Sale'.toUpperCase(),
                        color: Colors.orange,
                        textSize: 18,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.38,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return const OnSaleWidget();
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: 'Our Product', color: color, textSize: 18),
                  TextButton(
                    onPressed: () {
                      // GlobalMethod.navigateTo(
                      //     context: context, routeName: FeedsScreen.routeName);
                      Navigator.of(context).pushNamed(FeedsScreen.routeName);
                    },
                    child: TextWidget(
                        text: 'Brows All', color: Colors.blue, textSize: 19),
                  ),
                ],
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              //crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.87),
              children: List.generate(4, (index) {
                return const FeedsWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
