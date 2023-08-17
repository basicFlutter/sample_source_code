

import 'package:encrypt_shared_preferences/provider.dart';

class CacheProvider{

  static save(String key , dynamic value) async{
    await EncryptedSharedPreferences.initialize("1234567891234567");
    var sharedPrefs =  EncryptedSharedPreferences.getInstance();

    if (value is bool) {
      sharedPrefs.setBoolean(key, value);
    } else if (value is String) {
      sharedPrefs.setString(key, value);
    } else if (value is int) {
      sharedPrefs.setInt(key, value);
    } else if (value is double) {
      sharedPrefs.setDouble(key, value);
    }
  }

  static Future<bool> saveString(String key , String value) async{
    await EncryptedSharedPreferences.initialize("1234567891234567");
    var sharedPrefs =  EncryptedSharedPreferences.getInstance();
    bool result = await sharedPrefs.setString(key, value);
    return result;
  }


  static void saveInt(String key , int value) async{
    await EncryptedSharedPreferences.initialize("1234567891234567");
    var sharedPrefs =  EncryptedSharedPreferences.getInstance();
    await sharedPrefs.setInt(key, value);
  }



  static void saveBool(String key , bool value) async{
    await EncryptedSharedPreferences.initialize("1234567891234567");
    var sharedPrefs =  EncryptedSharedPreferences.getInstance();
    await sharedPrefs.setBoolean(key, value);
  }

  static Future<String?> getString(String key ) async{
    await EncryptedSharedPreferences.initialize("1234567891234567");
    var sharedPrefs =  EncryptedSharedPreferences.getInstance();
    String? stringValue = sharedPrefs.getString(key);
    return stringValue;
  }

  static Future<int> getInt(String key ) async{
    await EncryptedSharedPreferences.initialize("1234567891234567");
    var sharedPrefs =  EncryptedSharedPreferences.getInstance();
    int intValue = sharedPrefs.getInt(key) ?? 0;
    return intValue;
  }

  static Future<bool> getBool(String key ) async{
    await EncryptedSharedPreferences.initialize("1234567891234567");
    var sharedPrefs =  EncryptedSharedPreferences.getInstance();
    bool boolValue = sharedPrefs.getBoolean(key) ?? false;
    return boolValue;
  }



}