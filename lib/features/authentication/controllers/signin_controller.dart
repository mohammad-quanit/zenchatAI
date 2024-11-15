import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zenchatai/data/repositories/auth/auth_repository.dart';
import 'package:zenchatai/features/home/screens/home.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/helpers/network_manager.dart';
import 'package:zenchatai/utils/logging/logger.dart';
import 'package:zenchatai/utils/popups/fullscreen_loader.dart';
import 'package:zenchatai/utils/popups/loaders.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();
  final _auth = AuthRepository.instance;

  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final storage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Form key for validation
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    try {
      /// start loading
      ZFullScreenLoader.openLoadingDialog("Logging you in.", ZImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      ///  Form validation
      if (!signInFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Save Remember me if selected
      if(rememberMe.value) {
        storage.write("REMEMBER_ME_EMAIL", emailController.text.trim());
        storage.write("REMEMBER_ME_PASSWORD", passwordController.text.trim());
      }

      /// Register user in supabase authentication
      final userId = await _auth.signInWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      ZLoggerHelper.info(userId);
      ZFullScreenLoader.stopLoading();


    } catch (e) {
      // Remove loader
      ZFullScreenLoader.stopLoading();

      ZLoggerHelper.error(e.toString(), e);

      // Show the error :-(
      Zloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
