import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/features/authentication/controllers/onboarding_controller.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';
import 'package:zenchatai/utils/device/device_utility.dart';

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

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title, subTitle, image;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: ZHelperFunctions.screenWidth() * 0.8,
              height: ZHelperFunctions.screenWidth() * 0.6,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ZSizes.spaceBtwItems,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
