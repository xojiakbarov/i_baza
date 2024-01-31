import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static HiveService? _instance;
  late Box _box;

  factory HiveService() {
    if (_instance == null) {
      _instance = HiveService._();
    }
    return _instance!;
  }

  HiveService._();

  Future<void> initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _box = await Hive.openBox('myBox');
  }

  Box get box => _box;
}

// import 'package:shared_preferences/shared_preferences.dart';
//
// class StorageRepository {
//   static StorageRepository? _strageUtil;
//   static SharedPreferences? _preferences;
//
//   static Future<StorageRepository> getInstance() async {
//     if(_strageUtil == null ){
//       final secureStorage = StorageRepository._();
//       await secureStorage._init();
//       _strageUtil = secureStorage;
//     }
//     return _strageUtil!;
//   }
//
//   StorageRepository._();
//
//   Future<void> _init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   static bool getAuthStatus()  {
//     return  _preferences?.getBool('isAuthenticated') ?? false;
//   }
//
//   static Future<bool?> setAuthStatus(bool value) async {
//     return await _preferences?.setBool(('isAuthenticated'), value);
//   }
// }
