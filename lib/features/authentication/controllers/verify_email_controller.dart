import 'dart:async';
import 'package:get/get.dart';
import 'package:zenchatai/data/repositories/auth/auth_repository.dart';
import 'package:zenchatai/features/home/screens/home.dart';
import 'package:zenchatai/main.dart';
import 'package:zenchatai/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  final _auth = supabase.auth;

  late Timer _verificationCheckTimer;
  final RxBool isVerifying = true.obs;

  /// Polls the email verification status and redirects when verified
  @override
  void onInit() {
    super.onInit();
    _startVerificationCheck();
  }

  /// Starts a periodic timer to check email verification status
  void _startVerificationCheck() {
    _verificationCheckTimer = Timer.periodic(
      const Duration(seconds: 5),
          (timer) async {
        await _checkEmailVerificationStatus();
      },
    );
  }

  /// Checks if the email has been verified
  Future<void> _checkEmailVerificationStatus() async {
    try {
      // Refresh the user's session to get the latest user data
      final user = _auth.currentUser!;

      // If user is verified, stop the timer and redirect
      if (user.emailConfirmedAt != null) {
        isVerifying.value = false;
        _verificationCheckTimer.cancel(); // Stop the timer
        Zloaders.successSnackBar(
          title: "Email Verified",
          message: "Your email has been successfully verified!",
        );

        // Redirect to the home screen or other designated screen
        Get.offAll(() => const HomeScreen());
      }
    } catch (e) {
      Zloaders.errorSnackBar(
        title: "Verification Error",
        message: "An error occurred while checking email verification status.",
      );
      isVerifying.value = false;
      _verificationCheckTimer.cancel();
    }
  }

  /// Resend the email verification
  Future<void> resendVerificationEmail() async {
    try {
      // await instance.sendVerificationEmail();
      Zloaders.successSnackBar(
        title: "Verification Email Sent",
        message: "Please check your email to verify your account.",
      );
    } catch (e) {
      Zloaders.errorSnackBar(
        title: "Resend Failed",
        message: "Could not resend the verification email. Please try again.",
      );
    }
  }

  /// Clean up timer when controller is closed
  @override
  void onClose() {
    if (_verificationCheckTimer.isActive) {
      _verificationCheckTimer.cancel();
    }
    super.onClose();
  }
}
