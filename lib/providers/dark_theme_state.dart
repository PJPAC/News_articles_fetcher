import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

part 'dark_theme_state.g.dart';

@riverpod
class DarkThemeState extends _$DarkThemeState {
  void _loadDarkThemeState() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(darkModePreference) ?? false;
  }

  void _saveDarkThemeState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkModePreference, value);
  }

  @override
  bool build() {
    _loadDarkThemeState();
    return false;
  }

  void toggleDarkMode() {
    state = !state;
    _saveDarkThemeState(state);
  }
}
