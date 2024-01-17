import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/features/authentication/screens/Signup/signup.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: ZTexts.email,
                prefixIcon: Icon(Icons.email_outlined)),
          ),

          const SizedBox(height: ZSizes.spaceBtwInputFields / 2),

          /// Password
          TextFormField(
            decoration: const InputDecoration(
                labelText: ZTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          // const SizedBox(height: ZSizes.spaceBtwInputFields / 8),

          /// Forget Password & Remember me
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Forget Password
              TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: Text(ZTexts.forgetPassword,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: ZColors.primary)))
            ],
          ),

          /// Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(ZTexts.signIn),
            ),
          ),

          /// Create Account Text & Text button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(ZTexts.createAccountText,
                  style: Theme.of(context).textTheme.labelSmall),
              TextButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(ZSizes.xs)),
                child: Text(ZTexts.createAccount,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: ZColors.primary)),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
