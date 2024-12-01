import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../themes/font_size.dart';
import 'text.dart';

void showCustomSnackBar(String? message,
    {bool isError = true, showToaster = false}) {
  if (message != null && message.isNotEmpty) {
    if (showToaster && !GetPlatform.isWeb) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: AppFontSize.fontSizeDefault,
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.all(AppFontSize.paddingSizeSmall),
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppFontSize.radiusSmall)),
        content: CommonText(
          text: message,
          fontColor: Theme.of(Get.context!).cardColor,
        ),
      ));
    }
  }
}
