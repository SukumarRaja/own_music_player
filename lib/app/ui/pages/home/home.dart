import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:own_music_player/app/controllers/home.dart';

import '../../../themes/font_size.dart';
import '../../widgets/common/searchbar.dart';
import '../../widgets/common/text.dart';
import '../../widgets/home/trending_now.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => HomeController.to.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                const SizedBox(height: 30),
                CommonText(
                  text: "Hi There,",
                  fontSize: AppFontSize.fontSizeOverLarge,
                  fontWeight: FontWeight.w700,
                ),
                CommonText(
                  text: "Suku",
                  fontSize: AppFontSize.fontSizeExtraLarge,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.white,
                ),
                CommonSearchBar(text: "Search", onTap: () {}),
                const SizedBox(height: 20),
                CommonText(
                  text: "Trending Now",
                  fontSize: AppFontSize.fontSizeExtraLarge,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 8),
                const TrendingNow(),
              ],
            ),
    ));
  }
}
