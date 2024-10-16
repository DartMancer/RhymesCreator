import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/repositories/settings/settings_repository_interface.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required SettingsRepositoryI settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const ThemeState(brightness: Brightness.dark)) {
    _checkSelectedTheme();
  }

  final SettingsRepositoryI _settingsRepository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(ThemeState(brightness: brightness));
    await _settingsRepository.setDarkThemeSelected(
      brightness == Brightness.dark,
    );
  }

  void _checkSelectedTheme() {
    try {
      final brightness = _settingsRepository.isDarkThemeSelected()
          ? Brightness.dark
          : Brightness.light;
      emit(ThemeState(brightness: brightness));
    } catch (e) {
      log(e.toString());
    }
  }
}
