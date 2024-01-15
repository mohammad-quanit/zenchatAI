import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/common/styles/spacing_styles.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            LoginDivider(),

            SizedBox(height: ZSizes.spaceBtwSections / 2),

            /// Footer
            LoginFooter()
          ],
        ),
      )),
    );
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({
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
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: ZSizes.iconMd,
                height: ZSizes.iconMd,
                image: AssetImage(ZImages.google),
              )),
        )
      ],
    );
  }
}

class LoginDivider extends StatelessWidget {
  const LoginDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = ZHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isDark ? ZColors.darkGrey : ZColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          ZTexts.orSignInWith,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isDark ? ZColors.darkGrey : ZColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        )
      ],
    );
  }
}

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
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: ZTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),

          const SizedBox(height: ZSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            decoration: const InputDecoration(
                labelText: ZTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),

          const SizedBox(height: ZSizes.spaceBtwInputFields / 2),

          /// Forget Password & Remember me
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(ZTexts.rememberMe),
                ],
              ),

              /// Forget Password
              TextButton(
                onPressed: () {},
                child: const Text(ZTexts.forgetPassword),
              )
            ],
          ),

          const SizedBox(height: ZSizes.spaceBtwSections),

          /// Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(ZTexts.signIn),
            ),
          ),

          const SizedBox(height: ZSizes.spaceBtwSections / 2),

          /// Create Account button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text(ZTexts.createAccount),
            ),
          ),
        ],
      ),
    ));
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = ZHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(
                isDark ? ZImages.lightAppLogo : ZImages.darkAppLogo)),
        Text(ZTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: ZSizes.sm),
        Text(ZTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
