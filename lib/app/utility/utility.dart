import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

timeBasedGetGreetingMessage() {
  final now = DateTime.now();
  final hour = now.hour;

  if (hour < 12) {
    return 'Good morning!';
  } else if (hour < 17) {
    return 'Good afternoon!';
  } else if (hour < 21) {
    return 'Good evening!';
  } else {
    return 'Good night!';
  }
}

getTime() {
  DateTime now = DateTime.now();
  debugPrint(
      "time ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}");
  return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
}

launch({url}) async {
  await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.inAppBrowserView,
  );
}

nameValidator({value}) {
  if (value == null || value.isEmpty) {
    return 'name_empty'.tr;
  }
  if (value.length < 3 || value.length > 20) {
    return 'name_must_be'.tr;
  }
  return null;
}

emailValidator({value}) {
  if (value!.isEmpty) {
    return 'please_enter_email'.tr;
  }
  if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
      .hasMatch(value)) {
    return 'please_enter_valid_email'.tr;
  }
  return null;
}

passwordValidator({value}) {
  if (value!.isEmpty) {
    return 'please_enter_password'.tr;
  }
  if (value.length < 6) {
    return 'password_must'.tr;
  }
  return null;
}
