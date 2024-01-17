import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zenchatai/features/authentication/screens/Signup/widgets/signup_form.dart';
import 'package:zenchatai/common/widgets/divider_text.dart';
import 'package:zenchatai/common/widgets/social_buttons.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Title
              Text(ZTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Form
              const SignupForm(),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Divider
              ZDivider(dividerText: ZTexts.orSignUpWith.capitalize!),
              const SizedBox(height: ZSizes.defaultSpace),

              /// Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
