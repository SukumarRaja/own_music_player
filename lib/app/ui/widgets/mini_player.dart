import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:own_music_player/app/controllers/song.dart';

import '../pages/song/player.dart';
import 'common/animated_text.dart';
import 'common/image_card.dart';
import 'common/text.dart';
import 'mini_player_control.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(.3),
                spreadRadius: 1,
                blurRadius: 1)
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).secondaryHeaderColor,
              ])),
      child: Column(
        children: [
          Obx(
            () => ListTile(
              contentPadding: EdgeInsets.zero,
              dense: false,
              onTap: () {
                if (SongController.to.songDetail.isNotEmpty) {
                  Get.to(() => const SongPlayer(isFromMini: true));
                }
              },
              title: CommonText(
                  text: SongController.to.songDetail['title'] == null
                      ? ""
                      : SongController.to.songDetail['title']
                          .toString()
                          .replaceAll('&quot;', ''),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontColor: Colors.white),
              subtitle: AnimatedText(
                text: SongController.to.songDetail['subtitle'] == null
                    ? ""
                    : SongController.to.songDetail['subtitle']
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
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CommonCachedImageCard(
                  image: "${SongController.to.songDetail['image']}",
                  height: 100,
                  width: 80,
                ),
              ),
              trailing: Obx(() => SongController.to.songDetail.isEmpty
                  ? const SizedBox()
                  : const MiniPlayerControlButton()),
            ),
          ),
          StreamBuilder(
              stream: SongController.to.player.positionStream,
              builder: (context, snap) {
                final position = snap.data;
                return ((position?.inSeconds.toDouble() ?? 0) < 0.0 ||
                        ((position?.inSeconds.toDouble() ?? 0) > (240.0)))
                    ? const SizedBox()
                    : SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor:
                              Theme.of(context).colorScheme.secondary,
                          inactiveTrackColor: Colors.transparent,
                          trackHeight: 0.5,
                          thumbColor: Theme.of(context).colorScheme.secondary,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 1.0,
                          ),
                          overlayColor: Colors.transparent,
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 2.0,
                          ),
                        ),
                        child: Center(
                          child: StreamBuilder(
                              stream: SongController.to.player.durationStream,
                              builder: (context, sp) {
                                if (sp.data == null) {
                                  return const SizedBox();
                                } else {
                                  return Slider(
                                    inactiveColor: Colors.transparent,
                                    // activeColor: Colors.white,
                                    value: position!.inSeconds.toDouble(),
                                    max: sp.data!.inSeconds.toDouble(),
                                    onChanged: (newPosition) {
                                      // audioHandler.seek(
                                      //   Duration(
                                      //     seconds: newPosition.round(),
                                      //   ),
                                      // );
                                    },
                                  );
                                }
                              }),
                        ),
                      );
              }),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
