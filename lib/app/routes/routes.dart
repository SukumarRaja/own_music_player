import 'package:get/get.dart';

import '../ui/pages/auth/register.dart';
import '../ui/pages/home/main.dart';
import '../ui/pages/initial.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const Initial(),
      transition: Transition.zoom,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: '/register',
      page: () => const Register(),
      transition: Transition.zoom,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: '/home-main',
      page: () => const HomeMain(),
    )
  ];
}
