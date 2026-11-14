import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunchService {
  static const _key = 'sudah_pernah_buka';

  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? true;
  }

  static Future<void> markAsOpened() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
