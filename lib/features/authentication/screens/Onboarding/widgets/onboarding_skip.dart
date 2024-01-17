import 'package:flutter/material.dart';
import 'package:zenchatai/features/authentication/controllers/onboarding_controller.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/device/device_utility.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: ZDeviceUtils.getAppBarHeight(),
        right: ZSizes.defaultSpace,
        child: TextButton(
            onPressed: () => OnboardingController.instance.skipPage(),
            child: const Text(
              "Skip",
              style: TextStyle(
                  color: ZColors.primary, fontWeight: FontWeight.bold),
            )));
  }
}
