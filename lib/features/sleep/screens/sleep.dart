import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:zenchatai/features/sleep/controllers/sleep_controller.dart';

class SleepPatternScreen extends StatelessWidget {
  final SleepController controller = Get.put(SleepController());
  final AudioPlayer audioPlayer = AudioPlayer();

  SleepPatternScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Pattern Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Record Your Sleep Pattern:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: controller.updateSleepDetails,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter sleep details',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sleep Therapy Music:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildMusicCard(
                    title: 'Relaxing Ocean Waves',
                    onTap: () {
                      audioPlayer.play(UrlSource('https://file-examples.com/storage/fef4e75e176737761a179bf/2017/11/file_example_MP3_700KB.mp3'));
                    },
                  ),
                  _buildMusicCard(
                    title: 'Calming Forest Sounds',
                    onTap: () {
                      audioPlayer.play(UrlSource('https://file-examples.com/storage/fef4e75e176737761a179bf/2017/11/file_example_MP3_700KB.mp3'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMusicCard({required String title, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.play_arrow),
        onTap: onTap,
      ),
    );
  }
}
