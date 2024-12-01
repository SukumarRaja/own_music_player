import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

commonToast(
    {required msg,
    Color? fontColor = Colors.white,
    backgroundColor = Colors.grey}) async {
  Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: fontColor,
      fontSize: 16.0);
}
