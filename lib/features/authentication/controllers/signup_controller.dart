import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/data/repositories/auth/auth_repository.dart';
import 'package:zenchatai/data/repositories/supabase/user_supabase_table.dart';
import 'package:zenchatai/data/repositories/user/user_repository_impl.dart';
import 'package:zenchatai/features/authentication/models/user_model.dart';
import 'package:zenchatai/features/authentication/screens/EmailVerification/verify_email.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/network_manager.dart';
import 'package:zenchatai/utils/logging/logger.dart';
import 'package:zenchatai/utils/popups/fullscreen_loader.dart';
import 'package:zenchatai/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final _auth = AuthRepository.instance;

  // Form key for validation
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // variables
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxString selectedGender = ''.obs;

  final RxBool privacyPolicy = true.obs; // observer for privacy policy checkbox
  final RxBool hidePassword = true.obs; // observer for showing/hiding pw

  Future<void> signUp() async {
    try {
      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      ///  Form validation
      if (!signupFormKey.currentState!.validate()) return;

      if (!selectedGender.isNotEmpty) {
        Zloaders.warningSnackBar(
          title: "Please Select your Gender!",
        );
        return;
      }

      /// Privacy policy check
      if (!privacyPolicy.value) {
        Zloaders.warningSnackBar(
            title: ZTexts.acceptPrivacyPolicy,
            message:
                "In order to create account, you must have to read and accept the privacy policy & terms of use");
        return;
      }

      /// Start loader
      ZFullScreenLoader.openLoadingDialog(
          "We are processing your information...",
          ZImages.fullScreenLoadingAnimation);

      /// Register user in supabase authentication
      final userResponse = await _auth.signUpWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      // Ensure that the user response has a user and that a verification email was sent
      if (userResponse.user == null) {
        throw Exception("Signup failed. Please try again.");
      }


      /// Save auth user data in supabase
      final newUser = UserModel(
          id: userResponse.user!.id,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          gender: selectedGender.value);

      final userRepository =
          Get.put(UserRepositoryImpl(const UserSupabaseTable()));
      await userRepository.saveUserRecord(newUser);

      ZFullScreenLoader.stopLoading();

      /// show success snackbar
      Zloaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue");

      /// Move to verify email screen
      Get.to(() => const VerifyEmailScreen());
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
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    // super.dispose();
    super.onClose();
  }
}
