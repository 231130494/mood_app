import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameController with ChangeNotifier {
  String? _userName;

  String? get userName => _userName;

  NameController() {
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString('userName');
    notifyListeners();
  }

  Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    _userName = name;
    notifyListeners();
  }

  Future<void> clearUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userName');
    _userName = null;
    notifyListeners();
  }
}
