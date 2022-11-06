import 'package:flutter/material.dart';
import 'package:grocery_app/inner_screen/feeds_screen.dart';
import '../inner_screen/on_sale_sceen.dart';

class GlobalMethod{
  static navigateTo({required BuildContext context,required String routeName}){
    Navigator.pushNamed(context, OnSaleScreen.routeName);



  }
}