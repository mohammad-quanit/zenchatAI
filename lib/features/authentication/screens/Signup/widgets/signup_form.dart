import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/features/authentication/screens/EmailVerification/verify_email.dart';
import 'package:zenchatai/features/authentication/screens/Signup/widgets/gender_selector.dart';
import 'package:zenchatai/features/authentication/screens/Signup/widgets/policy_agreement.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: ZTexts.firstName,
                  labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
                  prefixIcon: Icon(Iconsax.user)),
            )),
            const SizedBox(width: ZSizes.spaceBtwInputFields),
            Expanded(
                child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: ZTexts.lastName,
                  labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
                  prefixIcon: Icon(Iconsax.user)),
            )),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwInputFields),

        /// username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: ZTexts.username,
              labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
              prefixIcon: Icon(Iconsax.user_edit)),
        ),

        const SizedBox(height: ZSizes.spaceBtwInputFields),

        /// email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: ZTexts.email,
              labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
              prefixIcon: Icon(Icons.email_outlined)),
        ),

        const SizedBox(height: ZSizes.spaceBtwInputFields),

        /// password
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            labelText: ZTexts.password,
            labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),

        const SizedBox(height: ZSizes.defaultSpace),

        // Select Gender
        const GenderSelector(),

        const SizedBox(height: ZSizes.defaultSpace / 2),

        // Terms and conditions checkbox
        const PolicyAgreement(),

        const SizedBox(height: ZSizes.defaultSpace),

        // Sign Up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(ZTexts.createAccount),
          ),
        ),
      ],
    ));
  }
}
