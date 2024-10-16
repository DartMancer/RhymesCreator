import 'package:shared_preferences/shared_preferences.dart';

import 'settings_repository_interface.dart';

class SettingsRepositoryImpl implements SettingsRepositoryI {
  SettingsRepositoryImpl({
    required this.preferences,
  });

  final SharedPreferences preferences;

  static const _isDarkThemeSelectedKey = 'dark_theme_selected';

  @override
  bool isDarkThemeSelected() {
    final selected = preferences.getBool(_isDarkThemeSelectedKey);
    return selected ?? false;
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async {
    preferences.setBool(_isDarkThemeSelectedKey, selected);
  }
}
