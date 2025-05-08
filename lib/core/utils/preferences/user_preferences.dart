import 'package:shared_preferences/shared_preferences.dart';

import 'keys/pref_keys.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static Future init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  // Setters
  static Future setID(int value) async =>
      await _preferences!.setInt(PrefKeys.iDKey, value);

  // Getters
  static int? getID() => _preferences!.getInt(PrefKeys.iDKey);

  // Clear
  static Future<void> removeID() =>
      _preferences!.remove(PrefKeys.iDKey);
}
