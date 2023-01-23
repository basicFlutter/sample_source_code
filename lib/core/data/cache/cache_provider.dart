import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const _prefixUrl = 'prefixUrl';
const _chatSessionId = 'chatSessionId' ;

class CacheProvider {
  CacheProvider._internal();

  late SharedPreferences _preferences;

  static final CacheProvider _singleton = CacheProvider._internal();

  factory CacheProvider() {
    return _singleton;
  }

  void setPrefixUrl(String url) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString(_prefixUrl, url);
  }

  FutureOr<String> getPrefixUrl() async {
    _preferences = await SharedPreferences.getInstance();
    return Future.value(_preferences.getString(_prefixUrl) ?? "");
  }


  void setSessionId(String id) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString(_chatSessionId, id);
  }

  FutureOr<String> getSessionId() async {
    _preferences = await SharedPreferences.getInstance();
    return Future.value(_preferences.getString(_chatSessionId) ?? "");
  }
}
