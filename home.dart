import 'package:flutter/material.dart';
import '../controller/load_data.dart';
import '../controller/icon_generator.dart';
import '../model/mood.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Mood> moodList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await LoadDataController().fetchMoodData();
    setState(() {
      moodList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mood Forecast")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : moodList.isEmpty
              ? const Center(child: Text("Gagal memuat data"))
              : ListView.builder(
                  itemCount: moodList.length,
                  itemBuilder: (context, index) {
                    final mood = moodList[index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          IconGenerator.getMoodIconUrl(mood.current.mood),
                          width: 48,
                        ),
                        title: Text("${mood.user} - ${mood.current.mood}"),
                        subtitle: Text("Skor Mood: ${mood.current.moodScore}"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(mood: mood),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
