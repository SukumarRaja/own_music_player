import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'abstract.dart';

class AudioPlayerHandleImplementation extends BaseAudioHandler
    with QueueHandler, SeekHandler
    implements AudioPlayerHandler {
  ///variables
  final player = AudioPlayer();
  int count = 0;
  Timer? sleepTimer;
  bool recommend = true;
  bool loadStart = true;
  bool useDown = true;
  AndroidEqualizerParameters? equalizerParams;

  final BehaviorSubject<List<MediaItem>> recentSubject =
      BehaviorSubject.seeded(<MediaItem>[]);

  final playlist = ConcatenatingAudioSource(children: []);

  Stream<List<IndexedAudioSource>> get effectiveSequence => Rx.combineLatest3<
              List<IndexedAudioSource>?,
              List<int>?,
              bool,
              List<IndexedAudioSource>?>(player.sequenceStream,
          player.shuffleIndicesStream, player.shuffleModeEnabledStream,
          (sequence, shuffleIndices, shuffleModeEnabled) {
        if (sequence == null) return [];
        if (!shuffleModeEnabled) return sequence;
        if (shuffleIndices == null) return null;
        if (shuffleIndices.length != sequence.length) return null;
        return shuffleIndices.map((i) => sequence[i]).toList();
      }).whereType<List<IndexedAudioSource>>();

  getQueueIndex({
    currentIndex,
    shuffleIndices,
    bool shuffleModeEnabled = false,
  }) {
    final effectiveIndices = player.effectiveIndices ?? [];
    final shuffleIndicesInv = List.filled(effectiveIndices.length, 0);
    for (var i = 0; i < effectiveIndices.length; i++) {
      shuffleIndicesInv[effectiveIndices[i]] = i;
    }
    return (shuffleModeEnabled &&
            ((currentIndex ?? 0) < shuffleIndicesInv.length))
        ? shuffleIndicesInv[currentIndex ?? 0]
        : currentIndex;
  }

  @override
  Future<void> moveQueueItem(int currentIndex, int newIndex) {
    // TODO: implement moveQueueItem
    throw UnimplementedError();
  }

  @override
  // TODO: implement queueState
  Stream<QueueState> get queueState =>
      Rx.combineLatest3<List<MediaItem>, PlaybackState, List<int>, QueueState>(
        queue,
        playbackState,
        player.shuffleIndicesStream.whereType<List<int>>(),
        (queue, playbackState, shuffleIndices) => QueueState(
          queue,
          playbackState.queueIndex,
          playbackState.shuffleMode == AudioServiceShuffleMode.all
              ? shuffleIndices
              : null,
          playbackState.repeatMode,
        ),
      ).where(
        (state) =>
            state.shuffleIndices == null ||
            state.queue.length == state.shuffleIndices!.length,
      );

  AudioPlayerHandleImplementation() {
    // _init();
  }
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
