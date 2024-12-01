import '../config/config.dart';

class ApiService {
  ///config
  static const appLog = "${AppConfig.baseUrl}${AppConfig.versionUrl}/AppLog";

  ///auth
  static const login =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/auth/phone-login";
  static const register =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/auth/phone-login";
  static const resetPassword =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/auth/phone-login";

  ///home
  static const getCategories =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/GetCategory";
  static const getBrands =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/getProductBrand";

  ///cart
  static const addToCart = "${AppConfig.baseUrl}${AppConfig.versionUrl}/brands";
  static const getCart = "${AppConfig.baseUrl}${AppConfig.versionUrl}/brands";

  ///profile
  static const getProfile =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/profile";

  static const updateProfile =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/profile/update";

  ///product
  static const videos =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/GetProductVideo";

  static const categoryProduct =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/GetProductByCategory";

  static const brandProduct =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/GetProductByBrand";

  static const productDetail =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/GetProduct";

  static const resupplyProductDetail =
      "${AppConfig.baseUrl}${AppConfig.versionUrl}/GetResupplyProduct";
}
