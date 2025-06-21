import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mood_app/controller/name_controller.dart';
import 'package:mood_app/controller/load_data.dart';
import 'package:mood_app/view/login.dart';
import 'package:mood_app/view/detail.dart';
import 'package:mood_app/controller/icon_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoadDataController>(context, listen: false).fetchMoodData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameProvider = Provider.of<NameController>(context);
    final moodProvider = Provider.of<LoadDataController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Consumer<NameController>(
          builder: (context, nameController, child) {
            return Text(
              'Hello, ${nameController.userName}',
              style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            );
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.orange),
            onPressed: () async {
              await nameProvider.clearUserName();
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            },
          ),
        ],
      ),
      body: moodProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : moodProvider.errorMessage.isNotEmpty
                ? Center(child: Text('Error: ${moodProvider.errorMessage}'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    itemCount: moodProvider.moods.length,
                    itemBuilder: (context, index) {
                      final mood = moodProvider.moods[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(mood: mood),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.network(
                                  IconGenerator.getMoodIconUrl(mood.currentMood.mood),
                                  width: 50,
                                  height: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.image_not_supported, size: 50, color: Colors.grey);
                                  },
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mood.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        mood.currentMood.mood,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  mood.currentMood.moodScore.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
    );
  }
}
