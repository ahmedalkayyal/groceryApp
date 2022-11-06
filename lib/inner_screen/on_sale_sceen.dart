import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import '../services/utils.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/OnSaleScreen';

  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    bool _isEmpty = true;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Product on Sale',
          isTitle: true,
          color: color,
          textSize: 22,
        ),
      ),
      body: _isEmpty
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/empty.jpg'),
                   const SizedBox(height: 100  ,),
                   const Text('No Thing'),
                  ],
                ),
              ),
          )
          : GridView.count(
              padding: EdgeInsets.zero,
              mainAxisSpacing: 1,
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.67),
              children: List.generate(16, (index) {
                return const OnSaleWidget();
              }),
            ),
    );
  }
}
