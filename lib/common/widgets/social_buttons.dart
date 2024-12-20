import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:zenchatai/main.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/sizes.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ZColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: const IconButton(
              onPressed: _googleSignIn,
              icon: Image(
                width: ZSizes.iconMd,
                height: ZSizes.iconMd,
                image: AssetImage(ZImages.google),
              )),
        )
      ],
    );
  }
}

Future<AuthResponse> _googleSignIn() async {
  final webClientId = dotenv.env['WEB_CLIENT_ID'];
  final iosClientId = dotenv.env['IOS_CLIENT_ID'];
  final androidClientId = dotenv.env['ANDROID_CLIENT_ID'];

  String? getClientId() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return androidClientId;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return iosClientId;
    } else if (kIsWeb) {
      return webClientId;
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // Google sign in on Android will work without providing the Android
  // Client ID registered on Google Cloud.

  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: getClientId(),
    serverClientId: webClientId,
  );
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }

  return supabase.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
}
