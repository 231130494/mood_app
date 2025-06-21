import 'package:flutter/material.dart';
import '../model/mood.dart';
import '../controller/icon_generator.dart';

class DetailPage extends StatelessWidget {
  final Mood mood;

  const DetailPage({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    final current = mood.current;
    final forecast = mood.forecast;

    return Scaffold(
      appBar: AppBar(title: Text("Detail Mood: ${mood.user}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              IconGenerator.getMoodIconUrl(current.mood),
              width: 100,
            ),
            const SizedBox(height: 10),
            Text("Mood Saat Ini: ${current.mood}", style: const TextStyle(fontSize: 18)),
            Text("Skor: ${current.moodScore}"),
            const Divider(height: 30),
            const Text("Forecast:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: forecast.length,
                itemBuilder: (context, index) {
                  final f = forecast[index];
                  return ListTile(
                    leading: Image.network(
                      IconGenerator.getMoodIconUrl(f.mood ?? ''),
                      width: 40,
                    ),
                    title: Text("${f.mood}"),
                    subtitle: Text("Skor: ${f.moodScore}"),
                    trailing: Text("${f.date?.day}/${f.date?.month}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
