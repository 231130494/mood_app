class CurrentMood {
    final String mood;
    final int moodScore;
    final int stressLevel;
    final int energyLevel;
    final int sleepQuality;

    CurrentMood({
        required this.mood,
        required this.moodScore,
        required this.stressLevel,
        required this.energyLevel,
        required this.sleepQuality,
    });

    factory CurrentMood.fromJson(Map<String, dynamic> json) => CurrentMood(
        mood: json["mood"],
        moodScore: json["moodScore"],
        stressLevel: json["stressLevel"],
        energyLevel: json["energyLevel"],
        sleepQuality: json["sleepQuality"],
    );

    Map<String, dynamic> toJson() => {
        "mood": mood,
        "moodScore": moodScore,
        "stressLevel": stressLevel,
        "energyLevel": energyLevel,
        "sleepQuality": sleepQuality,
    };
}
