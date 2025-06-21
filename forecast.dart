class Forecast {
    final DateTime date;
    final String mood;
    final int stressLevel;

    Forecast({
        required this.date,
        required this.mood,
        required this.stressLevel,
    });

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        date: DateTime.parse(json["date"]),
        mood: json["mood"],
        stressLevel: json["moodScore"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "mood": mood,
        "moodScore": stressLevel,
    };
}
