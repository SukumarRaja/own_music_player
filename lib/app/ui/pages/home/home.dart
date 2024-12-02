import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/searchbar.dart';
import '../../widgets/common/text.dart';
import '../../widgets/home/new_releases.dart';
import '../../widgets/home/top_playlist.dart';
import '../../widgets/home/trending_now.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => HomeController.to.loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        ///trending now
                        buildTitle(title: "Trending Now"),
                        const SizedBox(height: 8),
                        const TrendingNow(),
                        const SizedBox(height: 5),

                        ///top playlist
                        buildTitle(title: "Top Playlist"),
                        const SizedBox(height: 8),
                        const TopPlaylist(),
                        const SizedBox(height: 5),

                        ///new releases
                        buildTitle(title: "New Releases"),
                        const SizedBox(height: 8),
                        const NewReleases(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    ));
  }

  buildTitle({title}) {
    return CommonText(
      text: '$title',
      fontSize: AppFontSize.fontSizeExtraLarge,
      fontWeight: FontWeight.w700,
    );
  }
}
