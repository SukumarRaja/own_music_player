import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../controllers/song.dart';

class MiniPlayerControlButton extends StatefulWidget {
  const MiniPlayerControlButton({super.key});

  @override
  State<MiniPlayerControlButton> createState() =>
      _MiniPlayerControlButtonState();
}

class _MiniPlayerControlButtonState extends State<MiniPlayerControlButton> {
  @override
  void initState() {
    // SongController.to.playAudio(
    //     url: songDecode(
    //         mediaUrl:
    //             "${SongController.to.songDetail['more_info']['encrypted_media_url']}"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        StreamBuilder(
            stream: SongController.to.player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator());
              }
              return GestureDetector(
                onTap: () async {
                  if (playing == false) {
                    await SongController.to.player.play();
                  } else {
                    await SongController.to.player.stop();
                  }
                },
                child: Icon(
                  playing == false ? Icons.play_arrow : Icons.pause_rounded,
                  // size: 40.0,
                  color: Colors.white,
                ),
              );
            }),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print("kljkljkljlkjljl");
          },
          child: const Icon(
            Icons.skip_next,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
