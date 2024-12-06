import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/searchbar.dart';
import '../../widgets/common/text.dart';
import '../../widgets/home/best_of_90.dart';
import '../../widgets/home/bhakti.dart';
import '../../widgets/home/charts.dart';
import '../../widgets/home/city_mod.dart';
import '../../widgets/home/fresh_hit.dart';
import '../../widgets/home/new_releases.dart';
import '../../widgets/home/poscast.dart';
import '../../widgets/home/radio.dart';
import '../../widgets/home/top_albums.dart';
import '../../widgets/home/top_genres.dart';
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
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ///trending now
                        buildTitle(title: "Trending Now"),
                        const SizedBox(height: 8),
                        const TrendingNow(),
                        const SizedBox(height: 5),

                        ///top playlist
                        buildTitle(title: "Editorial Picks"),
                        const SizedBox(height: 8),
                        const TopPlaylist(),
                        const SizedBox(height: 5),

                        ///new releases
                        buildTitle(title: "New Releases"),
                        const SizedBox(height: 8),
                        const NewReleases(),

                        ///pick your mood
                        // buildTitle(title: "Pick Your Mood"),
                        // const SizedBox(height: 8),
                        // const Discover(),

                        ///charts
                        buildTitle(title: "Top Charts"),
                        const SizedBox(height: 8),
                        const Charts(),

                        ///city mode
                        buildTitle(title: "What's Hot In Coimbatore"),
                        const SizedBox(height: 8),
                        const CityMode(),

                        ///fresh hits
                        buildTitle(title: "Fresh Hits"),
                        const SizedBox(height: 8),
                        const FreshHits(),

                        ///top genres
                        buildTitle(title: "Top Genres & Moods"),
                        const SizedBox(height: 8),
                        const TopGenres(),

                        ///best of 90
                        buildTitle(title: "Best of 90's"),
                        const SizedBox(height: 8),
                        const BestOf90(),

                        ///top albums
                        buildTitle(title: "Top Albums"),
                        const SizedBox(height: 8),
                        const TopAlbums(),

                        ///bhakti
                        const SizedBox(height: 8),
                        const Bhakti(),

                        ///radio
                        buildTitle(title: "Radio"),
                        const SizedBox(height: 8),
                        const RadioStations(),

                        ///podcast
                        buildTitle(title: "Podcast"),
                        const SizedBox(height: 8),
                        const PodCast(),
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
