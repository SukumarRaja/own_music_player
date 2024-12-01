import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.put(ThemeController());

  final _darkTheme = false.obs;

  get darkTheme => _darkTheme.value;

  set darkTheme(value) {
    _darkTheme.value = value;
  }

  toggleTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    darkTheme = !darkTheme;
    pref.setBool('theme', darkTheme);
    update();
  }

  loadCurrentTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    darkTheme = pref.getBool('theme') ?? false;
    update();
  }
}
