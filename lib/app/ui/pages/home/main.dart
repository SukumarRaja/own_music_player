import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home.dart';
import '../../../controllers/main.dart';
import '../../widgets/mini_player.dart';
import 'home.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

List<Widget> pages = [
  const Home(),
  Container(color: Colors.yellow),
  Container(color: Colors.orange),
  Container(color: Colors.green),
];

class _HomeMainState extends State<HomeMain> {
  @override
  void initState() {
    HomeController.to.getLaunchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MainController.to.tabBarLength,
      initialIndex: MainController.to.tabBarIndex,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: TabBar(
            labelColor: Colors.white,
            indicatorColor: Theme.of(context).cardColor,
            unselectedLabelColor: const Color.fromARGB(255, 185, 196, 207),
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            labelStyle: const TextStyle(
              fontFamily: 'medium',
              fontSize: 10,
            ),
            onTap: (int index) {
              MainController.to.currentIndex = index;
            },
            tabs: [
              Tab(
                icon: buildIcon(icon: Icons.home, index: 0),
                text: 'Home',
                // text: "Home",
              ),
              Tab(
                icon: buildIcon(icon: Icons.videocam, index: 1),
                text: 'Videos',
              ),
              Tab(
                icon: buildIcon(icon: Icons.shopping_cart, index: 2),
                text: 'Cart',
              ),
              Tab(
                icon: buildIcon(icon: Icons.person, index: 3),
                text: 'Account',
              ),
            ],
          ),
        ),
        body: Obx(() => Stack(
              children: [
                pages[MainController.to.currentIndex],
                const Positioned(bottom: 0, right: 10, left: 10, child: MiniPlayer())
              ],
            )),
      ),
    );
  }

  buildIcon({required icon, required index}) {
    return Obx(() => Icon(icon,
        size: 28,
        color: MainController.to.currentIndex == index
            ? const Color.fromARGB(255, 255, 255, 255)
            : const Color.fromARGB(255, 172, 172, 172)));
  }
}
