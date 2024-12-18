import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/song.dart';
import '../../../themes/font_size.dart';
import '../../widgets/common/animated_text.dart';
import '../../widgets/common/image_card.dart';
import '../../widgets/common/text.dart';
import '../../widgets/song/seek_bar.dart';

class SongPlayer extends StatelessWidget {
  const SongPlayer({super.key, this.songId, this.isFromMini = false});

  final dynamic songId;
  final bool isFromMini;

  @override
  Widget build(BuildContext context) {
    // print("kljkljkl ${"https://aac.saavncdn.com/803/a4a46c89f4fc4a7c80c4694da79abe5a_96.mp4".replaceAll("_96.", "_320 kbps.".replaceAll(' kbps', ''))}");
    return GetBuilder(
        init: SongController(),
        initState: (_) {
          if (isFromMini == false) {
            SongController.to.getSongDetail(songId: songId);
          }
        },
        builder: (_) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 20, color: Colors.white),
              ),
              actions: const [
                Icon(Icons.lyrics, size: 25, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.share, size: 25, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.more_vert, size: 25, color: Colors.white),
                SizedBox(width: 15)
              ],
            ),
            body: Obx(
              () => SongController.to.songDetailLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SongController.to.songDetail.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: ListView(
                            children: [
                              const SizedBox(height: 10),
                              SizedBox(
                                  height: 250,
                                  width: Get.width,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CommonCachedImageCard(
                                          image:
                                              "${SongController.to.songDetail['image']}"))),
                              const SizedBox(height: 25),
                              CommonText(
                                text: SongController.to.songDetail['title']
                                    .toString()
                                    .replaceAll('&quot;', ''),
                                fontColor: Colors.white,
                                fontSize: AppFontSize.fontSizeOverLarge,
                                fontWeight: FontWeight.w800,
                              ),
                              AnimatedText(
                                text: SongController.to.songDetail['subtitle']
                                    .toString()
                                    .replaceAll('&quot;', ''),
                                pauseAfterRound: const Duration(seconds: 1),
                                showFadingOnlyWhenScrolling: true,
                                fadingEdgeEndFraction: 0.05,
                                fadingEdgeStartFraction: 0.05,
                                startAfter: const Duration(seconds: 2),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(.4),
                                    fontFamily: 'regular'),
                              ),
                              SeekBar(isFromMini: isFromMini),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
            ),
          );
        });
  }
}
