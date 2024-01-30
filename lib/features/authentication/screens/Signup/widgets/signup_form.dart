import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/features/authentication/controllers/signup_controller.dart';
import 'package:zenchatai/features/authentication/screens/Signup/widgets/gender_selector.dart';
import 'package:zenchatai/features/authentication/screens/Signup/widgets/policy_agreement.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/validators/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.firstNameController,
                  validator: (value) =>
                      ZValidator.validateText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: ZTexts.firstName,
                    labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                )),
                const SizedBox(width: ZSizes.spaceBtwInputFields),
                Expanded(
                    child: TextFormField(
                  controller: controller.lastNameController,
                  validator: (value) =>
                      ZValidator.validateText('Last Name', value),
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
              controller: controller.usernameController,
              validator: (value) => ZValidator.validateText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: ZTexts.username,
                  labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),

            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// email
            TextFormField(
              controller: controller.emailController,
              validator: (value) => ZValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: ZTexts.email,
                  labelStyle: TextStyle(fontSize: ZSizes.fontSizeSm),
                  prefixIcon: Icon(Icons.email_outlined)),
            ),

            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// password
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                validator: (value) => ZValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                  labelText: ZTexts.password,
                  labelStyle: const TextStyle(fontSize: ZSizes.fontSizeSm),
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
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
                onPressed: () => controller.signup(),
                child: const Text(ZTexts.createAccount),
              ),
            ),
          ],
        ));
  }
}
