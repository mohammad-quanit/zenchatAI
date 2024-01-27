import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zenchatai/features/authentication/screens/Login/login.dart';
import 'package:zenchatai/features/authentication/screens/Onboarding/onboarding.dart';

class AuthRepositiory extends GetxController {
  static AuthRepositiory get instance => Get.find();
  // final SupabaseAuth auth = supabase;

  /// Get storage
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //// Functionto show relavant screen
  screenRedirect() async {
    // local storage
    deviceStorage.writeIfNull("IsFirstTime", true);
    deviceStorage.read("IsFirstTime") != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }
}
