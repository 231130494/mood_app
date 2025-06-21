class Forecast {
  DateTime? date;
  String? mood;
  int? moodScore;

  Forecast({
    this.date,
    this.mood,
    this.moodScore,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        mood: json["mood"],
        moodScore: json["moodScore"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "mood": mood,
        "moodScore": moodScore,
      };
}
