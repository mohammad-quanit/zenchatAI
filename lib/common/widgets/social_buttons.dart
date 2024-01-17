import 'package:flutter/material.dart';
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
  /// update the Web client ID with your own.
  ///
  /// Web Client ID that you registered with Google Cloud.
  const webClientId = '175180413005-2p4gav4sbjpftotvv6pgkp8i50o849ur.apps.googleusercontent.com';

  /// update the iOS client ID with your own.
  ///
  /// iOS Client ID that you registered with Google Cloud.
  // const iosClientId = 'my-ios.apps.googleusercontent.com';

  // Google sign in on Android will work without providing the Android
  // Client ID registered on Google Cloud.

  final GoogleSignIn googleSignIn = GoogleSignIn(
    // clientId: iosClientId,
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
