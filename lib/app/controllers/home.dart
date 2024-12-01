import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());

  ///repository

  TabController? tabController;

  ///variable

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
}
