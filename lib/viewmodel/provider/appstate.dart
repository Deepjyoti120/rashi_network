import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }
}

final appStateRef = ChangeNotifierProvider<AppState>((ref) {
  return AppState();
});

final appStateautoDispose = ChangeNotifierProvider.autoDispose<AppState>((ref) {
  return AppState();
});
