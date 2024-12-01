import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

int statusCode = 0;

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  TabController? tabController;

  final _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;

  set currentIndex(value) {
    _currentIndex.value = value;
  }

  final _onBoardingList = <dynamic>[].obs;

  get onBoardingList => _onBoardingList.value;

  set onBoardingList(value) {
    _onBoardingList.value = value;
  }

  final _onboardSelectedIndex = 0.obs;

  get onboardSelectedIndex => _onboardSelectedIndex.value;

  set onboardSelectedIndex(value) {
    _onboardSelectedIndex.value = value;
  }

  final _tabBarIndex = 0.obs;

  get tabBarIndex => _tabBarIndex.value;

  set tabBarIndex(value) {
    _tabBarIndex.value = value;
  }

  final _tabBarLength = 4.obs;

  get tabBarLength => _tabBarLength.value;

  set tabBarLength(value) {
    _tabBarLength.value = value;
  }

  showLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var language = pref.getString('language');
    if (language != null && language.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  setLanguage({language}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('language', '$language');
  }

  getOnboardData() {
    List<dynamic> list = [
      {
        'image_url': 'assets/images/offer.png',
        'title': "on_boarding_1_title".tr,
        'description': "on_boarding_1_description".tr,
      },
      {
        'image_url': 'assets/images/offer.png',
        'title': "on_boarding_2_title".tr,
        'description': "on_boarding_2_description".tr,
      },
      {
        'image_url': 'assets/images/offer.png',
        'title': "on_boarding_3_title".tr,
        'description': "on_boarding_3_description".tr,
      },
    ];
    onBoardingList = list;
    return onBoardingList;
  }
}
