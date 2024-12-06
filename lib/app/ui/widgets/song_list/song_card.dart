import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/font_size.dart';
import '../../pages/song/player.dart';
import '../common/image_card.dart';
import '../common/text.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SongPlayer(
              songId: "${data['id']}",
            ));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CommonCachedImageCard(image: "${data['image']}"))),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                CommonText(
                  text: "${data['title']}",
                  fontColor: Colors.white,
                  fontSize: AppFontSize.fontSizeLarge,
                  fontWeight: FontWeight.w600,
                ),
                CommonText(
                  text: "${data['subtitle']}",
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'regular',
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              print("download");
            },
            child: const Icon(
              Icons.download,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              print("add to favorite");
            },
            child: const Icon(
              Icons.favorite_border,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              print("more");
            },
            child: const Icon(
              Icons.more_vert,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
