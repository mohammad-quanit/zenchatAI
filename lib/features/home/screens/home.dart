// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/common/widgets/app_bar.dart';
import 'package:zenchatai/features/home/screens/widgets/emoticon_face.dart';
import 'package:zenchatai/features/home/screens/widgets/greet.dart';
import 'package:zenchatai/features/home/screens/widgets/notifications.dart';
import 'package:zenchatai/features/home/screens/widgets/primary_header.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryHeaderContainer(
                child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  const ZCustomAppBar(
                    title: Column(
                      children: [Greet()],
                    ),
                    actions: [Notifications()],
                  ),

                  const SizedBox(height: ZSizes.spaceBtwSections),
                  // const SizedBox(height: ZSizes.spaceBtwSections),
                  // const SizedBox(height: ZSizes.spaceBtwSections),

                  Container(
                    padding: const EdgeInsets.all(ZSizes.xl),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("How do you feel, today!",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(
                                    color: ZColors.textWhite,
                                    fontSizeDelta: ZSizes.fontSizeSm - 4)),
                      ],
                    ),
                  ),

                  // const SizedBox(height: ZSizes.spaceBtwSections),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 0, left: ZSizes.xl, right: ZSizes.xl),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EmoticonFace(emotion: 'happy'),
                        EmoticonFace(emotion: 'sad'),
                        EmoticonFace(emotion: 'confused'),
                        EmoticonFace(emotion: 'angry'),
                        EmoticonFace(emotion: 'surprised'),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(
              height: ZSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
