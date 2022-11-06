import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addTextController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _addTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'hi,   ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'My Name',
                          style: TextStyle(
                              color: color,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: 'email@emal.com',
                    color: color,
                    textSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _ListTiles(
                  color: color,
                  title: 'Address',
                  subTitle: 'Sub Address',
                  icon: IconlyBold.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                ),
                _ListTiles(
                  color: color,
                  title: 'Order',
                  icon: IconlyBold.bag,
                  onPressed: () {},
                ),
                _ListTiles(
                  color: color,
                  title: 'Wishlist',
                  icon: IconlyBold.heart,
                  onPressed: () {},
                ),
                _ListTiles(
                  color: color,
                  title: 'Viewed',
                  icon: IconlyBold.show,
                  onPressed: () {},
                ),
                _ListTiles(
                  color: color,
                  title: 'Forget Password',
                  icon: IconlyBold.unlock,
                  onPressed: () {},
                ),

                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark Mode' : 'Light Mode',
                    color: color,
                    textSize: 22,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme,
                ),
                _ListTiles(
                  color: color,
                  title: 'Log out',
                  icon: IconlyBold.logout,
                  onPressed: () async {
                    await _showLogoutDialog();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warn.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 20,),
                const Text('Sign Out'),
              ],
            ),
            content: const Text('Do You Wanna Sign Out?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: TextWidget(
                    text: 'Cancel',
                    textSize: 18,
                    color: Colors.red,
                  ),
              ),
              TextButton(
                onPressed: () {

                },
                child: TextWidget(
                  text: 'Ok',
                  textSize: 18,
                  color: Colors.blue,
                ),
              ),
            ],

          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: _addTextController,
              // onChanged: (value){
              //   print(_addTextController.text);
              // },
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'Your Address'),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              ),
            ],
          );
        });
  }

  Widget _ListTiles({
    required String title,
    String? subTitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        //isTitle: true,
      ),
      subtitle: TextWidget(text: subTitle ?? "", color: color, textSize: 18),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
