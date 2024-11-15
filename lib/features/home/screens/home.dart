// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenchatai/common/widgets/app_bar.dart';
import 'package:zenchatai/features/home/screens/widgets/emoticon_face.dart';
import 'package:zenchatai/features/home/screens/widgets/greet.dart';
import 'package:zenchatai/features/home/screens/widgets/notifications.dart';
import 'package:zenchatai/features/home/screens/widgets/primary_header.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ZHelperFunctions.isDarkMode(context);

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
                        Column(
                          children: [
                            EmoticonFace(emotion: 'happy'),
                            SizedBox(height: ZSizes.xs),
                            Text("Happy",
                                style: TextStyle(
                                  color: ZColors.textWhite, // Sets text color
                                  fontWeight:
                                      FontWeight.bold, // Sets font weight
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            EmoticonFace(emotion: 'sad'),
                            SizedBox(height: ZSizes.xs),
                            Text("Sad",
                                style: TextStyle(
                                  color: ZColors.textWhite, // Sets text color
                                  fontWeight:
                                      FontWeight.bold, // Sets font weight
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            EmoticonFace(emotion: 'confused'),
                            SizedBox(height: ZSizes.xs),
                            Text("Confused",
                                style: TextStyle(
                                  color: ZColors.textWhite, // Sets text color
                                  fontWeight:
                                      FontWeight.bold, // Sets font weight
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            EmoticonFace(emotion: 'angry'),
                            SizedBox(height: ZSizes.xs),
                            Text("Angry",
                                style: TextStyle(
                                  color: ZColors.textWhite, // Sets text color
                                  fontWeight:
                                      FontWeight.bold, // Sets font weight
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            EmoticonFace(emotion: 'surprised'),
                            SizedBox(height: ZSizes.xs),
                            Text("Surprised",
                                style: TextStyle(
                                  color: ZColors.textWhite, // Sets text color
                                  fontWeight:
                                      FontWeight.bold, // Sets font weight
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            // const SizedBox(
            //   height: ZSizes.spaceBtwSections,
            // ),
            Row(
              children: [
                SizedBox(
                  width: 210,
                  // height: 220,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ZSizes.cardRadiusSm),
                    ),
                    margin: const EdgeInsets.all(ZSizes.md),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Relaxation',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(

                  width: 210,
                  // height: 220,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ZSizes.cardRadiusSm),
                    ),
                    margin: const EdgeInsets.all(ZSizes.md),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Image(
                              height: 120,
                              image: AssetImage(
                                  ZImages.motivationCardIllustration)),
                           SizedBox(
                            height: ZSizes.spaceBtwItems,
                          ),
                          Text(
                            'Motivation',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.deepPurple.shade200,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ZSizes.cardRadiusSm),
                    ),
                    margin: const EdgeInsets.all(ZSizes.md),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Image(
                          //     height: 120,
                          //     image: AssetImage(
                          //         ZImages.motivationCardIllustration)),
                          // SizedBox(
                          //   height: ZSizes.spaceBtwItems,
                          // ),
                          Text(
                            'Exercise',
                            style: TextStyle(fontSize: ZSizes.fontSizeLg),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
