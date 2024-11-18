import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenchatai/main.dart';
import 'package:zenchatai/features/authentication/screens/Login/login.dart';
import 'package:zenchatai/utils/logging/logger.dart';
import 'package:zenchatai/utils/popups/loaders.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userSession = supabase.auth.currentSession;
    final user = supabase.auth.currentUser;
    final profileImageUrl = user?.userMetadata?['avatar_url'];
    final fullName = user?.userMetadata?['full_name'];


    Future<void> signOut() async {
      try {
        await supabase.auth.signOut();
      } on AuthException catch (error) {
        Zloaders.errorSnackBar(title: 'Oh Snap!', message: error.message);

      } catch (error) {
        Zloaders.errorSnackBar(title: 'Oh Snap!', message: error.toString());
      } finally {
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: signOut,
            child: const Text('Sign out'),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (profileImageUrl != null)
              ClipOval(
                child: Image.network(
                  profileImageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              fullName ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
