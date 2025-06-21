import 'current_mood.dart';
import 'forecast.dart';

class Mood {
  final String user;
  final Current current;
  final List<Forecast> forecast;

  Mood({
    required this.user,
    required this.current,
    required this.forecast,
  });

  factory Mood.fromJson(Map<String, dynamic> json) => Mood(
        user: json["user"],
        current: Current.fromJson(json["current"]),
        forecast: List<Forecast>.from(
          json["forecast"].map((x) => Forecast.fromJson(x)),
        ),
      );
}
