import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadingStart() async {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> loadingEnd() async {
    _isLoading = false;
    notifyListeners();
  }

  void reset() {
    _isLoading = false;
    notifyListeners();
  }
}
