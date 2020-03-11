import 'package:shared_preferences/shared_preferences.dart';

class DarkModePreference {
  static const DARK_MODE = "DARK_MODE";

  setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(DARK_MODE, value);
  }

  Future<bool> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(DARK_MODE) ?? false;
  }
}