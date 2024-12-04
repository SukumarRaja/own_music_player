import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home.dart';
import '../../../themes/font_size.dart';
import '../common/image_card.dart';
import '../common/text.dart';

class Bhakti extends StatelessWidget {
  const Bhakti({super.key});

  ///mood
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HomeController.to.bhakti.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Tamil Bhakti',
                  fontSize: AppFontSize.fontSizeExtraLarge,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 8),
                SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: HomeController.to.bhakti.length,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var data = HomeController.to.bhakti[index];
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
                          );
                        })),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
