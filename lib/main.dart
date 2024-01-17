import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zenchatai/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load();

  /// Supabase credentials
  await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env['ANON_KEY']!);
  runApp(const App());
}

final supabase = Supabase.instance.client;
