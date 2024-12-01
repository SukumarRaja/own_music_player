import 'dart:convert';

import '../../services/api.dart';
import '../../services/http.dart';

class HomeRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> launchData({params}) async {
    var res = await helper.get(
        url: "${ApiService.homeData}${params ?? ""}",
        cookie: true,
        language: "tamil");
    return jsonDecode(res);
  }
}
