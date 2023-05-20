import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class DarkMode with ChangeNotifier {
  bool isDark;
  DarkMode({required this.isDark});
  toggleDarkMode() async {
    final Box settings = await Hive.openBox('settings');
    settings.put('isLightTheme', !isDark);
    isDark = !isDark;
    notifyListeners();
  }
}

final darkModeRef = ChangeNotifierProvider<DarkMode>((ref) {
  final settingsBox = Hive.box('settings');
  final isLightTheme = settingsBox.get('isLightTheme') ?? false;
  return DarkMode(isDark: isLightTheme);
});

final darkModeautoDispose = ChangeNotifierProvider.autoDispose<DarkMode>((ref) {
  final settingsBox = Hive.box('settings');
  final isLightTheme = settingsBox.get('isLightTheme') ?? false;
  return DarkMode(isDark: isLightTheme);
});
