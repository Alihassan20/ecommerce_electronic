
//
// import 'package:get_storage/get_storage.dart';
//
// abstract class AppStorage {
//
//   static const String _BOX = 'Address';
//   static GetStorage _box = GetStorage();
//
//   static Future<void> init() async =>
//       await GetStorage.init();
//
//   static Future<void> addAdress(String value) async {
//     final address = getAddress();
//     address.insert(0, value);
//     await _box.write(_BOX, address);
//   }
//
//   static void _updateAdress (List notes) => _box.write(_BOX, notes);
//
//   static List getAddress() => _box.hasData(_BOX) ? _box.read(_BOX) : [];
//
//   static void removeAdress (int index) {
//     final notes = getAddress();
//     notes.removeAt(index);
//     _updateAdress(notes);
//   }
//
//   static Future<void> updateNote(int index, String note) async {
//     final notes = getAddress();
//     notes[index] = note;
//     _updateAdress(notes);
//   }
//
// }












// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppStorage {
//
//   static  SharedPreferences? _prefs;
//
//   static Future<void> init() async => _prefs = await SharedPreferences.getInstance();
//
//   static Future<void> cacheUserData({
//     required String email,
//     required String apiToken,
//     required String uid,
//   }) async {
//     await _prefs!.setString('email', email);
//     await _prefs!.setString('apiToken', apiToken);
//     await _prefs!.setString('uid', uid);
//   }
//
//   static bool get isLogged => _prefs!.containsKey('apiToken');
//
//   static String get apiToken => _prefs!.getString('apiToken')!;
//   static String get email => _prefs!.getString('email')!;
//   static String get uid => _prefs!.getString('uid')!;
//
// }