import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zenchatai/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenchatai/data/repositories/auth_repository.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///  Load env variables
  await dotenv.load();

  /// Initializa Local Storage
  await GetStorage.init();

  /// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Supabase credentials
  await Supabase.initialize(
          url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env['ANON_KEY']!)
      .then((value) => Get.put(AuthRepository()));

  runApp(const App());
}

final supabase = Supabase.instance.client;
