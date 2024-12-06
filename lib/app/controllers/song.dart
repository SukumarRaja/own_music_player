import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../data/repository/song.dart';
import 'main.dart';
import 'package:audio_session/audio_session.dart';

class SongController extends GetxController {
  static SongController get to => Get.put(SongController());

  ///repository
  final repository = SongRepository();

  ///player
  final player = AudioPlayer();

  ///variables
  final _loading = false.obs;

  get loading => _loading.value;

  set loading(value) {
    _loading.value = value;
  }

  final _songData = {}.obs;

  get songData => _songData.value;

  set songData(value) {
    _songData.value = value;
  }

  final _artistSongData = {}.obs;

  get artistSongData => _artistSongData.value;

  set artistSongData(value) {
    _artistSongData.value = value;
  }

  final _songDetailLoading = false.obs;

  get songDetailLoading => _songDetailLoading.value;

  set songDetailLoading(value) {
    _songDetailLoading.value = value;
  }

  final _songDetail = {}.obs;

  get songDetail => _songDetail.value;

  set songDetail(value) {
    _songDetail.value = value;
  }

  getSongList({token, type}) async {
    loading = true;
    var n = "10";
    var p = "1";
    var params = "token=$token&type=$type&n=$n&p=$p";
    try {
      var res = await repository.getSongsList(params: params);
      if (statusCode == 200) {
        loading = false;
        if (type == "song") {
          songData = res['songs'][0];
        } else if (type == "artist") {
          artistSongData = res;
        } else {
          songData = res;
        }
        debugPrint("Successfully get song list");
      } else {
        loading = false;
        debugPrint("Failed to  get song list");
      }
    } catch (e) {
      loading = false;
      // showCustomSnackBar("Error on get song list\n$e");
      debugPrint("Error on get song list $e");
    }
  }

  getSongDetail({songId}) async {
    songDetailLoading = true;
    var params = "&pids=$songId";
    try {
      var res = await repository.getSongsDetail(params: params);
      if (statusCode == 200) {
        songDetailLoading = false;
        songDetail = res['songs'][0];
        debugPrint("Successfully get song detail\n$songDetail");
      } else {
        songDetail = {};
        songDetailLoading = false;
        debugPrint("Failed to get song detail");
      }
    } catch (e) {
      songDetailLoading = false;
      debugPrint("Error on get song detail $e");
    }
  }

  playAudio({url}) async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    } on PlayerException catch (e) {
      print("Error loading audio source: $e");
    }
  }
}
