import 'package:flutter/material.dart';
import 'package:zenchatai/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  /// Supabase credentials
  await Supabase.initialize(
      url: 'https://lwyobyydvdriwaukdbjf.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx3eW9ieXlkdmRyaXdhdWtkYmpmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDU0ODMzMjYsImV4cCI6MjAyMTA1OTMyNn0.Awi7QbNh9gHf0ahIvl2vge5SphKbzXc4WpcxtYtZssY');
  runApp(const App());
}

final supabase = Supabase.instance.client;
