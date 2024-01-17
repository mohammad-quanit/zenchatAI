import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenchatai/features/profile/screens/account/user_profile.dart';

import 'package:zenchatai/main.dart';
import 'package:zenchatai/common/styles/spacing_styles.dart';
import 'package:zenchatai/common/widgets/divider_text.dart';
import 'package:zenchatai/common/widgets/social_buttons.dart';
import 'package:zenchatai/features/authentication/screens/Login/widgets/login_form.dart';
import 'package:zenchatai/features/authentication/screens/Login/widgets/login_header.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: ZSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            /// Header with logo, title, subtitle
            LoginHeader(),

            /// Login Form
            LoginForm(),

            /// Divider
            ZDivider(dividerText: ZTexts.orSignInWith),

            SizedBox(height: ZSizes.spaceBtwSections / 2),

            /// Footer
            SocialButtons()
          ],
        ),
      )),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SingleChildScrollView(
//           child: Padding(
//         padding: ZSpacingStyle.paddingWithAppBarHeight,
//         child: Column(
//           children: [
//             /// Header with logo, title, subtitle
//             LoginHeader(),

//             /// Login Form
//             LoginForm(),

//             /// Divider
//             ZDivider(dividerText: ZTexts.orSignInWith),

//             SizedBox(height: ZSizes.spaceBtwSections / 2),

//             /// Footer
//             SocialButtons()
//           ],
//         ),
//       )),
//     );
//   }
// }


