import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../controllers/song.dart';
import '../../../../utility/utility.dart';

class ControlButtons extends StatefulWidget {
  const ControlButtons({super.key, required this.isFormMini});

  final bool isFormMini;

  @override
  State<ControlButtons> createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  @override
  void initState() {
    if (widget.isFormMini == false) {
      SongController.to.playAudio(
          url: songDecode(
              mediaUrl:
                  "${SongController.to.songDetail['more_info']['encrypted_media_url']}"));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            icon: Icon(Icons.shuffle_rounded,
                color: Theme.of(context).disabledColor),
            onPressed: () {}),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.skip_previous_rounded),
                  iconSize: 45.0,
                  color: Theme.of(context).disabledColor,
                  onPressed: () {}),
              StreamBuilder(
                  stream: SongController.to.player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return const CircularProgressIndicator();
                    }
                    return FloatingActionButton(
                      elevation: 10,
                      backgroundColor: Colors.white,
                      onPressed: () async {
                        if (playing == false) {
                          await SongController.to.player.play();
                        } else {
                          await SongController.to.player.stop();
                        }
                      },
                      child: Icon(
                        playing == false
                            ? Icons.play_arrow
                            : Icons.pause_rounded,
                        size: 40.0,
                        color: Colors.black,
                      ),
                    );
                  }),
              IconButton(
                  icon: const Icon(Icons.skip_next_rounded),
                  iconSize: 45.0,
                  color: Theme.of(context).disabledColor,
                  onPressed: () {}),
            ],
          ),
        ),
        IconButton(
            icon: const Icon(Icons.repeat),
            color: Theme.of(context).disabledColor,
            onPressed: () {}),
      ],
    );
  }
}
