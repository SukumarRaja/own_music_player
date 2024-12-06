import '../config/config.dart';

class ApiService {
  ///config
  static const homeData =
      "${AppConfig.baseUrl}${AppConfig.version}&__call=webapi.getLaunchData";

  ///song
  static const songList =
      "${AppConfig.baseUrl}${AppConfig.version}&__call=webapi.get";

  static const songDetail =
      "${AppConfig.baseUrl}${AppConfig.version}&__call=song.getDetails";
}
