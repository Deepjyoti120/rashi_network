import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/viewmodel/model/user_reports.dart';

class AppState with ChangeNotifier {
  int _currentIndex = 0;
  UserReports _userReports = UserReports();

  int get currentIndex => _currentIndex;
  UserReports get userReports => _userReports;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  set userReports(UserReports userReports) {
    _userReports = userReports;
    notifyListeners();
  }
}

final appStateRef = ChangeNotifierProvider<AppState>((ref) {
  return AppState();
});

final appStateautoDispose = ChangeNotifierProvider.autoDispose<AppState>((ref) {
  return AppState();
});
