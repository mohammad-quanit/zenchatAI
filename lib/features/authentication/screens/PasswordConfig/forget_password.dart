import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/features/authentication/screens/PasswordConfig/reset_password.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// headions
            Text(
              ZTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: ZSizes.defaultSpace,
            ),
            Text(
              ZTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: ZSizes.spaceBtwSections,
            ),

            ///email text field
            TextFormField(
              decoration: const InputDecoration(
                labelText: ZTexts.email,
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwSections,
            ),

            /// submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPasswordScreen()),
                  child: const Text(ZTexts.submit)),
            ),
          ],
        ),
      ),
    );
  }
}
