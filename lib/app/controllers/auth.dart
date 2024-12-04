import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/pages/auth/login.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  ///register text controllers
  final name = TextEditingController();
  final phone = TextEditingController();

  ///form keys
  final loginFormKey = GlobalKey<FormState>();

  ///variables

  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  final _termsAndConditions = false.obs;

  get termsAndConditions => _termsAndConditions.value;

  set termsAndConditions(value) {
    _termsAndConditions.value = value;
  }

  final _onboardingSelectedIndex = 0.obs;

  get onboardingSelectedIndex => _onboardingSelectedIndex.value;

  set onboardingSelectedIndex(value) {
    _onboardingSelectedIndex.value = value;
  }

  final _countryCode = "+91".obs;

  get countryCode => _countryCode.value;

  set countryCode(value) {
    _countryCode.value = value;
  }

  loginCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    debugPrint("token is:  $token");
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkOnBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('on_boarding');
    if (token == null) {
      return true;
    } else {
      return false;
    }
  }

  setOnBoardDataAfterScreenCompleted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("on_boarding", "onBoarding");
    var onBoard = preferences.getString('on_boarding');
    debugPrint("on boarding data $onBoard");
    Get.off(() => const Login());
  }

  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    if (token != null && token.isNotEmpty) {
      await preferences.remove('token');
      Get.offNamed('/login');
    }
  }

  login() async {}
}
