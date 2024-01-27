import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/utils/helpers/network_manager.dart';
import 'package:zenchatai/utils/popups/fullscreen_loader.dart';
import 'package:zenchatai/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Form key for validation
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // variables
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signup() async {
    try {
      /// Start loader
      ZFullScreenLoader.openLoadingDialog(
          "We are processing your information...", "animation");

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      ///  Form validation
      if (!signupFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }
    } catch (e) {
      Zloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return;
    } finally {
      ZFullScreenLoader.stopLoading();
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
