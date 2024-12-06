import 'package:flutter/material.dart';
import 'package:own_music_player/app/controllers/song.dart';
import 'package:own_music_player/app/themes/font_size.dart';

import '../common/text.dart';
import 'seekbar/control_buttons.dart';
import 'seekbar/sliding_panel.dart';

class SeekBar extends StatelessWidget {
  const SeekBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: SongController.to.player.playerStateStream,
        builder: (context, snap) {
          return Column(
            children: [
              const SizedBox(height: 10),
              SlidingPanelCard(),
              const SizedBox(height: 30),
              ControlButtons(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border,
                          color: Theme.of(context).disabledColor),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.download,
                          color: Theme.of(context).disabledColor),
                      onPressed: () {}),
                ],
              ),
            ],
          );
        });
  }
}
