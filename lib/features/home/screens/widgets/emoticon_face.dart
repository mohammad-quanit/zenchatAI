import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/utils/constants/sizes.dart';

class EmoticonFace extends StatelessWidget {
  final String emotion;

  const EmoticonFace({super.key, required this.emotion});

  // Method to get the appropriate emoji based on the emotion
  String _getEmoji() {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return "😊";
      case 'sad':
        return "😢";
      case 'confused':
        return "😕";
      case 'angry':
        return "😡";
      case 'surprised':
        return "😲";
      default:
        return "😊"; // Default emoji
    }
  }

  @override
  Widget build(BuildContext context) {
    final EmotionController controller = Get.put(EmotionController()); // Retrieve the GetX controller
    print(controller.selectedEmotion);

    return GestureDetector(
      onTap: () {
        // Update the selected emotion in the GetX state
        controller.updateEmotion(emotion);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(ZSizes.borderRadiusLg),
        ),
        padding: const EdgeInsets.all(10),
        // margin: const EdgeInsets.all(15),
        child: Text(
          _getEmoji(),
          style: const TextStyle(
            fontSize: ZSizes.iconLg,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class EmotionController extends GetxController {
  // Reactive state variable to hold the selected emotion
  var selectedEmotion = ''.obs;

  // Method to update the emotion
  void updateEmotion(String emotion) {
    selectedEmotion.value = emotion;
  }
}