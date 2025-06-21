import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mood_app/model/mood.dart';

class LoadDataController {
  final String apiUrl =
      'https://gist.githubusercontent.com/Angello28/fd8316139b12acdc179f403439d4fa6f/raw/ab3b4e3f459bd5bf603331eb6322955e5d4e4de1/mood.json';

  Future<List<Mood>> fetchMoodData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((e) => Mood.fromJson(e)).toList();
      } else {
        print('Gagal fetch data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error saat fetch data: $e');
      return [];
    }
  }
}
