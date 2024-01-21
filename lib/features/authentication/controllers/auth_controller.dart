import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenchatai/features/authentication/screens/Login/login.dart';
import 'package:zenchatai/features/dashboard/screens/home.dart';
import 'package:zenchatai/features/profile/screens/account/user_profile.dart';
import 'package:zenchatai/main.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    _setupAuthListener();
    super.onInit();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        Get.off(() => const HomeScreen());
      } else {
        Get.off(() => const LoginScreen());
      }
    });
  }
}
