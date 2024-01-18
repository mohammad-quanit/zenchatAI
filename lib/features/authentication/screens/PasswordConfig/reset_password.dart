import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/features/authentication/screens/Login/login.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            Image(
              image: const AssetImage(ZImages.deliveredEmailIllustration),
              width: ZHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),

            /// Title and Subtitle
            Text(
              ZTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),

            Text(
              ZTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const LoginScreen()),
                  child: const Text(ZTexts.done)),
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {}, child: const Text(ZTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
