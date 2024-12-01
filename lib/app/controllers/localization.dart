import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/language.dart';
import '../languages/language.dart';

class LocalizationController extends GetxController {
  static LocalizationController get to => Get.put(LocalizationController());

  final _isLtr = true.obs;

  get isLtr => _isLtr.value;

  set isLtr(value) {
    _isLtr.value = value;
  }

  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;

  set selectedIndex(value) {
    _selectedIndex.value = value;
  }

  final _locale =
      Locale(languages[0].languageCode!, languages[0].countryCode).obs;

  get locale => _locale.value;

  set locale(value) {
    _locale.value = value;
  }

  final _language = <LanguageModel>[].obs;

  get language => _language.value;

  set language(value) {
    _language.value = value;
  }

  final _allLanguage = <String, Map<String, String>>{}.obs;

  get allLanguage => _allLanguage.value;

  set allLanguage(value) {
    _allLanguage.value = value;
  }

  initializeAllLanguages() async {
    for (LanguageModel languageModel in languages) {
      String jsonStringValues = await rootBundle
          .loadString('assets/language/${languageModel.languageCode}.json');
      Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      allLanguage[
          '${languageModel.languageCode}_${languageModel.countryCode}'] = json;
      update();
    }
    update();
    return allLanguage;
  }

  setLanguage(Locale loc) {
    Get.updateLocale(loc);
    locale = loc;
    if (locale.languageCode == 'ar') {
      isLtr = false;
    } else {
      isLtr = true;
    }
    saveLanguage(locale);
    update();
  }

  saveLanguage(Locale locale) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('language_code', locale.languageCode);
    pref.setString('country_code', locale.countryCode!);
  }

  loadCurrentLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    locale = Locale(
        pref.getString('language_code') ?? languages[0].languageCode!,
        pref.getString('country_code') ?? languages[0].countryCode);
    isLtr = locale.languageCode != 'ar';
    for (int index = 0; index < languages.length; index++) {
      if (languages[index].languageCode == locale.languageCode) {
        selectedIndex = index;
        break;
      }
    }
    language.addAll(languages);
    update();
  }

  searchLanguage(String query) {
    if (query.isEmpty) {
      language = [];
      language = languages;
    } else {
      selectedIndex = -1;
      language = [];
      for (var lan in languages) {
        if (lan.languageName!.toLowerCase().contains(query.toLowerCase())) {
          language.add(lan);
        }
      }
    }
    update();
  }
}
