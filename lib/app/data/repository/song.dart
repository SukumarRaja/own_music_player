import 'dart:convert';

import '../../services/api.dart';
import '../../services/http.dart';

class SongRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> getSongsList({params}) async {
    var res = await helper.get(
        url: "${ApiService.songList}&${params ?? ""}",
        cookie: true,
        language: "tamil");
    return jsonDecode(res);
  }
}
