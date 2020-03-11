import 'package:flutter/material.dart';
import 'package:provider_dark_mode_switch/dark_mode_preference.dart';

class DarkModeProvider extends ChangeNotifier {
  DarkModePreference darkModePreference = DarkModePreference();
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
    darkModePreference.setDarkMode(value);
    notifyListeners();
  }

}