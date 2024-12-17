import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'abstract.dart';

class AudioPlayerHandleImplementation extends BaseAudioHandler
    with QueueHandler, SeekHandler
    implements AudioPlayerHandler {
  ///variables
  int count = 0;
  Timer? sleepTimer;
  bool recommend = true;
  bool loadStart = true;
  bool useDown = true;
  AndroidEqualizerParameters? equalizerParams;

  @override
  Future<void> moveQueueItem(int currentIndex, int newIndex) {
    // TODO: implement moveQueueItem
    throw UnimplementedError();
  }

  @override
  // TODO: implement queueState
  Stream<QueueState> get queueState => throw UnimplementedError();

  @override
  Future<void> setVolume(double volume) {
    // TODO: implement setVolume
    throw UnimplementedError();
  }

  @override
  // TODO: implement speed
  ValueStream<double> get speed => throw UnimplementedError();

  @override
  // TODO: implement volume
  ValueStream<double> get volume => throw UnimplementedError();
}
