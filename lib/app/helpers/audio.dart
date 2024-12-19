
import '../services/abstract.dart';

class AudioHandlerHelper {
  static final AudioHandlerHelper _instance = AudioHandlerHelper._internal();

  factory AudioHandlerHelper() {
    return _instance;
  }

  AudioHandlerHelper._internal();

  static bool _isInitialized = false;
  static AudioPlayerHandler? audioHandler;

  // Future<void> _initialize() async {
  //   audioHandler = await AudioService.init(
  //     builder: () => AudioPlayerHandlerImpl(),
  //     config: AudioServiceConfig(
  //       androidNotificationChannelId:
  //           'com.example.own_music_player.channel.audio',
  //       androidNotificationChannelName: 'Beat',
  //       androidNotificationIcon: 'mipmap/ic_launcher',
  //       androidShowNotificationBadge: true,
  //       androidStopForegroundOnPause: false,
  //       notificationColor: Colors.grey[900],
  //     ),
  //   );
  // }

  Future<AudioPlayerHandler> getAudioHandler() async {
    if (!_isInitialized) {
      // await _initialize();
      _isInitialized = true;
    }
    return audioHandler!;
  }
}
