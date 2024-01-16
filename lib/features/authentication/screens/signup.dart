import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/common/widgets/divider_text.dart';
import 'package:zenchatai/common/widgets/social_buttons.dart';
import 'package:zenchatai/utils/constants/colors.dart';
// import 'package:zenchatai/common/styles/spacing_styles.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Title
              Text(ZTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Form
              Form(
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

                  const GenderSelector(),

                  const SizedBox(height: ZSizes.defaultSpace / 2),

                  // Terms and conditions checkbox
                  const PolicyAgreement(),

                  const SizedBox(height: ZSizes.defaultSpace),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(ZTexts.createAccount),
                    ),
                  ),
                ],
              )),

              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Divider
              const ZDivider(dividerText: ZTexts.orSignUpWith),

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

class PolicyAgreement extends StatelessWidget {
  const PolicyAgreement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = ZHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            height: ZSizes.lg,
            width: ZSizes.lg,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(
          width: ZSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${ZTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.labelSmall),
          TextSpan(
              text: '${ZTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: isDark ? ZColors.white : ZColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? ZColors.white : ZColors.primary,
                  )),
          TextSpan(
              text: '${ZTexts.and} ',
              style: Theme.of(context).textTheme.labelSmall),
          TextSpan(
              text: '${ZTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: isDark ? ZColors.white : ZColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? ZColors.white : ZColors.primary,
                  )),
        ]))
      ],
    );
  }
}

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});
  @override
  GenderSelectorState createState() => GenderSelectorState();
}

class GenderSelectorState extends State<GenderSelector> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              child: Text(
                'Gender: ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildGenderRadioButton('Male'),
                buildGenderRadioButton('Female'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildGenderRadioButton(String gender) {
    return Row(
      children: [
        Radio(
          value: gender,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
        Text(gender),
      ],
    );
  }
}
