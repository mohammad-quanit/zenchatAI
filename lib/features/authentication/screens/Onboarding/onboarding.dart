import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/features/authentication/controllers/onboarding_controller.dart';
import 'package:zenchatai/features/authentication/screens/Onboarding/widgets/onboarding_circular_button.dart';
import 'package:zenchatai/features/authentication/screens/Onboarding/widgets/onboarding_dot_nav.dart';
import 'package:zenchatai/features/authentication/screens/Onboarding/widgets/onboarding_skip.dart';
import 'package:zenchatai/features/authentication/screens/Onboarding/widgets/onboarding_view.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingView(
                image: ZImages.onBoardingImage1,
                title: ZTexts.onBoardingTitle1,
                subTitle: ZTexts.onBoardingSubTitle1,
              ),
              OnboardingView(
                image: ZImages.onBoardingImage2,
                title: ZTexts.onBoardingTitle2,
                subTitle: ZTexts.onBoardingSubTitle2,
              ),
              OnboardingView(
                image: ZImages.onBoardingImage3,
                title: ZTexts.onBoardingTitle3,
                subTitle: ZTexts.onBoardingSubTitle3,
              )
            ],
          ),

          // Skip Button
          const OnboardingSkip(),

          //Dot navigation smooth page indicator
          const OnboardingDotNavigation(),

          //Circular Button
          const OnboardingCircularBtn(),
        ],
      ),
    );
  }
}
