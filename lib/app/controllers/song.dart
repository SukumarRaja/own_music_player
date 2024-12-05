import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:own_music_player/app/controllers/main.dart';

import '../data/repository/song.dart';
import '../ui/widgets/common/snack_bar.dart';

class SongListController extends GetxController {
  static SongListController get to => Get.put(SongListController());

  ///repository
  final repository = SongRepository();

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
}
