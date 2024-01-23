import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenchatai/features/authentication/screens/Login/login.dart';
import 'package:zenchatai/main.dart';
import 'package:zenchatai/navigation/navigation_menu.dart';

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
        Get.off(() => const NavigationMenu());
      } else {
        Get.off(() => const LoginScreen());
      }
    });
  }
}
