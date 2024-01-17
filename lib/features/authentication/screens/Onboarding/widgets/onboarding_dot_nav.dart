import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zenchatai/features/authentication/controllers/onboarding_controller.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';
import 'package:zenchatai/utils/device/device_utility.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = ZHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: ZDeviceUtils.getBottomNavigationBarHeight() + 30,
        left: ZSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? ZColors.white : ZColors.primary,
            dotHeight: 6,
          ),
        ));
  }
}
