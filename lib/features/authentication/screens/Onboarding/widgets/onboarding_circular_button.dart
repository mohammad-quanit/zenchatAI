import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/features/authentication/controllers/onboarding_controller.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';
import 'package:zenchatai/utils/device/device_utility.dart';

class OnboardingCircularBtn extends StatelessWidget {
  const OnboardingCircularBtn({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: ZDeviceUtils.getBottomNavigationBarHeight(),
        right: ZSizes.defaultSpace,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? ZColors.primary : ZColors.primary),
          onPressed: () => OnboardingController.instance.nextPage(),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
