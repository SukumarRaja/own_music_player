import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home.dart';
import '../../../themes/font_size.dart';
import '../common/image_card.dart';
import '../common/text.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          itemCount: HomeController.to.trendingNow.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var data = HomeController.to.trendingNow[index];
            dynamic album;
            if (data['more_info']['artistMap'] != null) {
              album =
                  data['more_info']['artistMap']['artists'][0]['name'] ?? "";
            } else {
              album = data['more_info']['listname'] ?? "";
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CommonCachedImageCard(
                      image: "${data['image']}",
                      height: 150,
                      width: 160,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      CommonText(
                        text: "${data['title']}",
                        fontColor: Colors.white,
                      ),
                      CommonText(
                        text: "${data['type'].toString().capitalize} $album",
                        fontSize: AppFontSize.fontSizeExtraSmall,
                        fontColor: Colors.white.withOpacity(.7),
                        fontFamily: 'regular',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}