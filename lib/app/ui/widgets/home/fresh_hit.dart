import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home.dart';
import '../../../themes/font_size.dart';
import '../../pages/song/list.dart';
import '../common/image_card.dart';
import '../common/text.dart';

class FreshHits extends StatelessWidget {
  const FreshHits({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: HomeController.to.freshHits.length,
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var data = HomeController.to.freshHits[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => SongsList(
                      permaUrl: "${data['perma_url']}",
                      type: "${data['type']}",
                    ));
              },
              child: Column(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "${data['title']}",
                          fontColor: Colors.white,
                        ),
                        CommonText(
                          text: "${data['subtitle'] ?? ""}",
                          fontSize: AppFontSize.fontSizeExtraSmall,
                          fontColor: Colors.white.withOpacity(.7),
                          fontFamily: 'regular',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
