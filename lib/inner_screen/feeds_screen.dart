import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../services/utils.dart';
import '../widgets/feeds_items.dart';
import '../widgets/text_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  static const routeName = '/FeedsScreen';

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode=FocusNode();

  @override
  void dispose() {
    _searchTextController.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
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
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'All Product ',
          isTitle: true,
          color: color,
          textSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchTextController,
                  onChanged: (val) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    hintText: 'What\'s in your mind ? ',
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        _searchTextController.clear();
                        _searchTextFocusNode.unfocus();
                      },
                      icon:  Icon(
                        Icons.close,
                        color: _searchTextFocusNode.hasFocus ?  Colors.red: color,
                      ),
                    ),
                  ),
                ),
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
              children: List.generate(10, (index) {
                return const FeedsWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
