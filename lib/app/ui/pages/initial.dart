import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth.dart';
import '../../controllers/main.dart';
import 'auth/login.dart';
import 'home/main.dart';
import 'onboard.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  void initState() {
    super.initState();
  }

  String? isLogin;

  Future<bool> onWillPop() async {
    // This dialog will exit your app on saying yes
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: const Center(
                child: Text(
              'Are you sure?',
              style: TextStyle(fontFamily: 'medium'),
            )),
            content: const Text('Do you want to exit an App'),
            contentTextStyle:
                const TextStyle(fontFamily: 'medium', color: Colors.grey),
            titleTextStyle: TextStyle(
                fontFamily: 'medium',
                color: Theme.of(context).primaryColor,
                fontSize: 16),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Colors.grey,
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.white, fontFamily: 'medium'),
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'medium',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: GetBuilder<AuthController>(
            init: AuthController(),
            initState: (state) async {
              // AuthController.to.checkIsUpdateAvailable();
              bool showLanguage = await MainController.to.showLanguage();

              bool login = await AuthController.to.loginCheck();
              debugPrint("is Login: $login");
              bool onBoarding = await AuthController.to.checkOnBoarding();
              debugPrint("onBoarding value $onBoarding");

              if (login == true) {
                setState(() {
                  isLogin = "isLogin";
                });
              } else if (onBoarding == true) {
                setState(() {
                  isLogin = 'onboarding';
                });
              } else {
                debugPrint("logged in $isLogin");
              }
            },
            builder: (controller) => isLogin == 'onboarding'
                ? const Onboarding()
                : isLogin == "isLogin"
                    ? const HomeMain()
                    : const Login()),
      ),
    );
  }
}
