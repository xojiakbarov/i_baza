// import 'package:i_baza/objectbox.g.dart';
// import 'package:path_provider/path_provider.dart';
//
// class LocaleDatabase {
//   static LocaleDatabase? _database;
//   static Store? _store;
//   static Future<LocaleDatabase> getInstance() async {
//     if(_database == null){
//       _store = await _init();
//       _database = LocaleDatabase._();
//     }
//     return _database!;
//   }
//
//   static Future<Store> _init() async {
//     final applocationDirectory = await getApplicationDocumentsDirectory();
//
//     final store =
//         await openStore(directory: '${applocationDirectory.path}/database');
//
//     return store;
//   }
//
//
//   LocaleDatabase._();
// }