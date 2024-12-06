import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_des/dart_des.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

getTokenFromPermaUrl({url}) {
  var token = url.toString().split('/').last;
  return token;
}

///1k, 10k, 1m, 10m separator
numberFormatter({value}) {
  var formatter = NumberFormat.compact(locale: 'en_US', explicitSign: false);
  return formatter.format(double.parse(value));
  // var num = double.parse(value);
  // if (num > 999 && num < 99999) {
  //   return "${(num / 1000).toStringAsFixed(1)} K";
  // } else if (num > 99999 && num < 999999) {
  //   return "${(num / 1000).toStringAsFixed(0)} K";
  // } else if (num > 999999 && num < 999999999) {
  //   return "${(num / 1000000).toStringAsFixed(1)} M";
  // } else if (num > 999999999) {
  //   return "${(num / 1000000000).toStringAsFixed(1)} B";
  // } else {
  //   return num.toString();
  // }
}

songDecode({mediaUrl}) {
  const String key = '38346591';
  final DES desECB = DES(key: key.codeUnits);

  final Uint8List encrypted = base64.decode(mediaUrl);
  final List<int> decrypted = desECB.decrypt(encrypted);
  final String decoded = utf8
      .decode(decrypted)
      .replaceAll(RegExp(r'\.mp4.*'), '.mp4')
      .replaceAll(RegExp(r'\.m4a.*'), '.m4a')
      .replaceAll(RegExp(r'\.mp3.*'), '.mp3');
  print("url ${decoded.replaceAll('http:', 'https:')}");
  return decoded.replaceAll('http:', 'https:');
}
