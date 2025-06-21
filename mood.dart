import 'current_mood.dart';
import 'forecast.dart';

class Mood {
  final String name;
  final CurrentMood currentMood;
  final List<Forecast> forecast;

  Mood({
    required this.name,
    required this.currentMood,
    required this.forecast,
  });

  factory Mood.fromJson(Map<String, dynamic> json) => Mood(
        name: json["user"],
        currentMood: CurrentMood.fromJson(json["current"]),
        forecast: List<Forecast>.from(
          json["forecast"].map((x) => Forecast.fromJson(x)),
        ),
      );
}
