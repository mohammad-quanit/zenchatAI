import 'package:get/get.dart';

class SleepController extends GetxController {
  var sleepDetails = ''.obs;

  void updateSleepDetails(String details) {
    sleepDetails.value = details;
  }
}
