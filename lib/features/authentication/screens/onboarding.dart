import 'package:flutter/material.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable pages
          PageView(
            children: [
              Image(
                image: const AssetImage(ZImages.onBoardingImage1),
                width: ZHelperFunctions.screenWidth() * 0.8,
                height: ZHelperFunctions.screenWidth() * 0.6,
              )
            ],
          )
        ],
      ),
    );
  }
}
