import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home.dart';
import '../../../themes/font_size.dart';
import '../common/image_card.dart';
import '../common/text.dart';

class TopPlaylist extends StatelessWidget {
  const TopPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: HomeController.to.topPlaylist.length,
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var data = HomeController.to.topPlaylist[index];
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
                        text:
                            "${data['type'].toString().capitalize} ${data['subtitle'].toString().split(' ')[0]}",
                        fontSize: AppFontSize.fontSizeExtraSmall,
                        fontColor: Colors.white.withOpacity(.7),
                        fontFamily: 'regular',
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