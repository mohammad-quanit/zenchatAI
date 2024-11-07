import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenchatai/features/authentication/screens/Login/login.dart';
import 'package:zenchatai/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:zenchatai/main.dart';
import 'package:zenchatai/navigation/navigation_menu.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/exceptions/auth_exceptions.dart';
import 'package:zenchatai/utils/exceptions/format_exceptions.dart';
import 'package:zenchatai/utils/exceptions/platform_exceptions.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();
  final _auth = supabase.auth;

  /// Get storage
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    _screenRedirect();
    _setupAuthListener();
  }

  //// Functionto show relavant screen
  void _screenRedirect() async {
    // local storage
    await deviceStorage.writeIfNull("IsFirstTime", true);
    await deviceStorage.read("IsFirstTime") != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

  /// Listening Google auth state
  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      print(event);
      if (event == AuthChangeEvent.signedIn) {
        Get.off(() => const NavigationMenu());
      } else {
        Get.off(() => const LoginScreen());
      }
    });
  }

  /// Register User Method
  Future<AuthResponse> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final AuthResponse response =
          await _auth.signUp(email: email, password: password);

      if (response.user!.identities!.isEmpty) {
        throw ZSupabaseAuthException('email-already-in-use');
      }
      return response;
    } on FormatException catch (_) {
      throw const ZFormatException();
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (error) {
      throw '${ZTexts.catchMessage} $error';
    }
  }

  /// Email Verification
  // Future<void> sendEmailVerification() async {
  //   try {
  //     await _auth.
  //   } catch (e) {

  //   }
  // }

  /// Sign In User Method
  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await _auth.signInWithPassword(
        email: email,
        password: password,
      );

      final userId = response.user?.id;
      return userId;
    } on FormatException catch (_) {
      throw const ZFormatException();
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (error) {
      print(error.toString());
      throw ZTexts.catchMessage;
    }
  }
}


 // final userId = response.user?.id;
      // if (userId == null) {
      //   throw UnimplementedError();
      // }