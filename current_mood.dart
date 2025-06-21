class Current {
  final String mood;
  final int moodScore;
  final int stressLevel;
  final int sleepQuality;
  final int energyLevel;

  Current({
    required this.mood,
    required this.moodScore,
    required this.stressLevel,
    required this.sleepQuality,
    required this.energyLevel,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        mood: json["mood"],
        moodScore: json["moodScore"],
        stressLevel: json["stressLevel"],
        sleepQuality: json["sleepQuality"],
        energyLevel: json["energyLevel"],
      );
}
