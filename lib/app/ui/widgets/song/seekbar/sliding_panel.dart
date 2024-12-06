import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../controllers/song.dart';
import '../../../../themes/font_size.dart';
import '../../common/text.dart';

class SlidingPanelCard extends StatefulWidget {
  const SlidingPanelCard({super.key});

  @override
  State<SlidingPanelCard> createState() => _SlidingPanelCardState();
}

class _SlidingPanelCardState extends State<SlidingPanelCard> {
  var position = SongController.to.player.position;
  var duration = SongController.to.player.duration;
  var bufferedPosition = SongController.to.player.bufferedPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: SongController.to.player.speedStream,
            builder: (context, snapshot) {
              var speed = "${snapshot.data?.toStringAsFixed(1) ?? 1.0}x";
              return Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: CommonText(
                    text: speed,
                    fontColor: speed == '1.0x'
                        ? Theme.of(context).disabledColor
                        : null,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }),
        const SizedBox(height: 10),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 6.0,
              ),
              child: StreamBuilder(
                  stream: SongController.to.player.durationStream,
                  builder: (context, snap) {
                    return SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: HiddenThumbComponentShape(),
                        overlayShape: SliderComponentShape.noThumb,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white.withOpacity(.3),
                        trackShape: const RectangularSliderTrackShape(),
                      ),
                      child: ExcludeSemantics(
                        child: Slider(
                          max: duration!.inMilliseconds.toDouble(),
                          value: min(
                            position.inMilliseconds.toDouble(),
                            duration!.inMilliseconds.toDouble(),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    );
                  }),
            ),
            StreamBuilder(
                stream: SongController.to.player.positionStream,
                builder: (context, snap) {
                  return SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.transparent,
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.white,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 8.0,
                      ),
                      overlayShape: SliderComponentShape.noThumb,
                    ),
                    child: Slider(
                      max: duration!.inMilliseconds.toDouble(),
                      value: min(
                        position.inMilliseconds.toDouble(),
                        duration!.inMilliseconds.toDouble(),
                      ),
                      onChanged: (value) {},
                      onChangeEnd: (value) {},
                    ),
                  );
                }),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                  stream: SongController.to.player.positionStream,
                  builder: (context, snap) {
                    return CommonText(
                      text:
                          RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch('$position')?.group(1) ?? '$position',
                      fontColor: Theme.of(context).disabledColor,
                      fontSize: AppFontSize.fontSizeSmall,
                    );
                  }),
              StreamBuilder(
                  stream: SongController.to.player.durationStream,
                  builder: (context, snap) {
                    return CommonText(
                        text:
                            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch('$duration')?.group(1) ?? '$duration');
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}
