import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mood_app/model/mood.dart';

List<Mood> moodFromJson(String str) =>
    List<Mood>.from(json.decode(str).map((x) => Mood.fromJson(x)));

class LoadDataController with ChangeNotifier {
  List<Mood> _moods = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Mood> get moods => _moods;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  static const String _apiUrl =
      'https://gist.githubusercontent.com/Angello28/fd8316139b12acdc179f403439d4fa6f/raw/ab3b4e3f459bd5bf603331eb6322955e5d4e4de1/mood.json';

  Future<void> fetchMoodData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_apiUrl));

      if (response.statusCode == 200) {
        _moods = moodFromJson(response.body);
      } else {
        _errorMessage = 'Failed to load data: ${response.statusCode}';
        debugPrint('Error fetching mood data: ${response.statusCode}');
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      debugPrint('Error fetching mood data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
