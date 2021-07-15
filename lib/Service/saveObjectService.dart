import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String UserKey = 'currentUser';
  static LocalStorageService _instance;
  static SharedPreferences _preferences;
  LocalStorageService._instantiate();
  static final LocalStorageService instance =
      LocalStorageService._instantiate();

/*
  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }
*/

  Future<dynamic> getFromDisk(String key) {
    var value = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  Future<void> saveStringToDisk(String key, String content) {
    print(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    _preferences.setString(UserKey, content);
  }
  /*Future setupLocator() async {
    var instance = await LocalStorageService.getInstance();
    locator.registerSingleton<LocalStorageService>(instance);
  }*/
}
