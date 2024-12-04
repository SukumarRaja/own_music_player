import 'package:get/get.dart';

import '../data/repository/home.dart';
import '../ui/widgets/common/snack_bar.dart';
import 'main.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());

  ///repository
  final repository = HomeRepository();

  final _loading = false.obs;

  get loading => _loading.value;

  set loading(value) {
    _loading.value = value;
  }

  final _trendingNow = <dynamic>[].obs;

  get trendingNow => _trendingNow.value;

  set trendingNow(value) {
    _trendingNow.value = value;
  }

  final _topPlaylist = <dynamic>[].obs;

  get topPlaylist => _topPlaylist.value;

  set topPlaylist(value) {
    _topPlaylist.value = value;
  }

  final _newReleases = <dynamic>[].obs;

  get newReleases => _newReleases.value;

  set newReleases(value) {
    _newReleases.value = value;
  }

  final _discover = <dynamic>[].obs;

  get discover => _discover.value;

  set discover(value) {
    _discover.value = value;
  }

  final _charts = <dynamic>[].obs;

  get charts => _charts.value;

  set charts(value) {
    _charts.value = value;
  }

  final _radio = <dynamic>[].obs;

  get radio => _radio.value;

  set radio(value) {
    _radio.value = value;
  }

  final _freshHits = <dynamic>[].obs;

  get freshHits => _freshHits.value;

  set freshHits(value) {
    _freshHits.value = value;
  }

  final _bestOf90 = <dynamic>[].obs;

  get bestOf90 => _bestOf90.value;

  set bestOf90(value) {
    _bestOf90.value = value;
  }

  final _topAlbums = <dynamic>[].obs;

  get topAlbums => _topAlbums.value;

  set topAlbums(value) {
    _topAlbums.value = value;
  }

  final _podCast = <dynamic>[].obs;

  get podCast => _podCast.value;

  set podCast(value) {
    _podCast.value = value;
  }

  final _bhakti = <dynamic>[].obs;

  get bhakti => _bhakti.value;

  set bhakti(value) {
    _bhakti.value = value;
  }

  getLaunchData() async {
    loading = true;
    try {
      var res = await repository.launchData();
      if (statusCode == 200) {
        loading = false;
        trendingNow = res['new_trending'];
        topPlaylist = res['top_playlists'];
        newReleases = res['new_albums'];
        discover = res['browse_discover'];
        charts = res['charts'];
        radio = res['radio'];
        freshHits = res['promo:vx:data:68'];
        bestOf90 = res['promo:vx:data:185'];
        topAlbums = res['promo:vx:data:117'];
        podCast = res['promo:vx:data:139'];
        bhakti = res['promo:vx:data:164'] ?? [];
      } else {
        loading = false;
        showCustomSnackBar("Failed to get launch data $statusCode");
      }
    } catch (e) {
      loading = false;
      showCustomSnackBar("Error on get launch data $e");
    }
  }
}
