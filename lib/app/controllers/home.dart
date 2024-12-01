import 'package:get/get.dart';

import '../data/repository/home.dart';
import '../ui/widgets/common/snack_bar.dart';
import 'main.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());

  ///repository
  final repository = HomeRepository();

  final _loading = false.obs;

  get loading => _loading.value;

  set loading(value) {
    _loading.value = value;
  }

  final _trendingNow = <dynamic>[].obs;

  get trendingNow => _trendingNow.value;

  set trendingNow(value) {
    _trendingNow.value = value;
  }

  getLaunchData() async {
    loading = true;
    try {
      var res = await repository.launchData();
      if (statusCode == 200) {
        loading = false;
        print("res $res");
        trendingNow = res['new_trending'];
      } else {
        loading = false;
        showCustomSnackBar("Failed to get launch data $statusCode");
      }
    } catch (e) {
      loading = false;
      showCustomSnackBar("Error on get launch data $e");
    }
  }
}
