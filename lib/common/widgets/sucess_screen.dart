import 'package:flutter/material.dart';
import 'package:zenchatai/common/styles/spacing_styles.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class ZSuccessScreen extends StatelessWidget {
  const ZSuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ZSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage(image),
                width: ZHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              /// Title and Subtitle
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
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ZSizes.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(ZTexts.done)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
