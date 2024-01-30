import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenchatai/features/authentication/screens/Login/login.dart';
import 'package:zenchatai/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:zenchatai/main.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();
  final _auth = supabase.auth;

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

  /// Register User
  Future<AuthResponse> signUpEmailAndPassword(
      String email, String password) async {
    try {
      final AuthResponse response =
          await _auth.signUp(email: email, password: password);
      // final userId = response.user?.id;
      // if (userId == null) {
      //   throw UnimplementedError();
      // }
      return response;
    } catch (error) {
      print(error.toString());
      throw "Somethin Went wrong!";
    }
  }

  /// Sign In User
  Future<String> signInEmailAndPassword(String email, String password) async {
    final response = await _auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }

    return userId;
  }
}
