import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/features/authentication/controllers/signin_controller.dart';
import 'package:zenchatai/features/authentication/screens/PasswordConfig/forget_password.dart';
import 'package:zenchatai/features/authentication/screens/Signup/signup.dart';
import 'package:zenchatai/navigation/navigation_menu.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SigninController controller = Get.put(SigninController());

    return Form(
        // key: controller.signInFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Email
              TextFormField(
                controller: controller.emailController,
                validator: (value) => ZValidator.validateEmail(value),
                decoration: const InputDecoration(
                    labelText: ZTexts.email,
                    prefixIcon: Icon(Icons.email_outlined)),
              ),

              const SizedBox(height: ZSizes.spaceBtwInputFields / 2),

              /// password
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  validator: (value) =>
                      ZValidator.validateText("Password", value),
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
              // const SizedBox(height: ZSizes.spaceBtwInputFields / 8),

              /// Forget Password & Remember me
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Forget Password
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,),
                      ),
                      const Text(ZTexts.rememberMe),
                      TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () =>
                              Get.to(() => const ForgetPasswordScreen()),
                          child: Text(ZTexts.forgetPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: ZColors.primary))),
                    ],
                  )
                ],
              ),

              /// Sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signIn(),
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
