import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zenchatai/common/styles/spacing_styles.dart';
import 'package:zenchatai/common/widgets/divider_text.dart';
import 'package:zenchatai/common/widgets/social_buttons.dart';
import 'package:zenchatai/features/authentication/controllers/auth_controller.dart';
import 'package:zenchatai/features/authentication/screens/Login/widgets/login_form.dart';
import 'package:zenchatai/features/authentication/screens/Login/widgets/login_header.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

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
