import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs{

  static const THEME_STATUS='THEME STATUS';

  setDarkTheme(bool value)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    //value in input
    prefs.setBool(THEME_STATUS, value);
  }
  Future<bool>getTheme() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}