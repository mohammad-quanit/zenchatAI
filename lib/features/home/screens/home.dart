// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenchatai/common/widgets/app_bar.dart';
import 'package:zenchatai/features/Relaxation/screens/relax.dart';
import 'package:zenchatai/features/home/screens/widgets/emoticon_face.dart';
import 'package:zenchatai/features/home/screens/widgets/greet.dart';
import 'package:zenchatai/features/home/screens/widgets/notifications.dart';
import 'package:zenchatai/features/home/screens/widgets/primary_header.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/image_strings.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';
import 'package:zenchatai/utils/logging/logger.dart';

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
                        top: 0,
                        bottom: ZSizes.xl,
                        left: ZSizes.xl,
                        right: ZSizes.xl),
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
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.4, // Adjust width dynamically
                    child: Card(
                      color: Colors.deepPurple.shade100,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ZSizes.cardRadiusSm),
                      ),
                      margin: const EdgeInsets.all(ZSizes.md),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(ZSizes.cardRadiusSm),
                        splashColor: Colors.deepPurple.shade300,
                        onTap: () {
                          ZHelperFunctions.navigateToScreen(context, RelaxationScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(ZSizes.md),
                          child: Column(
                            children: [
                              Image(
                                height: 120,
                                image: AssetImage(ZImages.relaxationFeature),
                              ),
                              Text(
                                'Relaxation',
                                style: TextStyle(
                                  color: ZColors.black,
                                  fontSize: ZSizes.fontSizeLg + 5,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.4, // Adjust width dynamically
                    child: Card(
                      color: Colors.deepOrange.shade100,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ZSizes.cardRadiusSm),
                      ),
                      margin: const EdgeInsets.all(ZSizes.md),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(ZSizes.cardRadiusSm),
                        splashColor: Colors.deepOrange.shade300,
                        onTap: () {
                          ZHelperFunctions.navigateToScreen(context, RelaxationScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(ZSizes.md),
                          child: Column(
                            children: [
                              Image(
                                height: 120,
                                image: AssetImage(
                                    ZImages.motivationCardIllustration),
                              ),
                              Text(
                                'Motivation',
                                style: TextStyle(
                                  color: ZColors.black,
                                  fontSize: ZSizes.fontSizeLg + 5,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.blue.shade100,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ZSizes.cardRadiusSm),
                      ),
                      margin: const EdgeInsets.all(ZSizes.md),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(ZSizes.cardRadiusSm),
                        splashColor: Colors.blue.shade300,
                        onTap: () {
                          ZHelperFunctions.navigateToScreen(context, RelaxationScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(ZSizes.md),
                          child: Row(
                            children: [
                              // Image on the left
                              Image(
                                height: 120,
                                width:
                                    120, // Add a fixed width for consistent sizing
                                image: AssetImage(ZImages.meditationFeature),
                              ),

                              // Text on the right
                              Expanded(
                                child: Text(
                                  'Meditation',
                                  style: TextStyle(
                                    color: ZColors.black,
                                    fontSize: ZSizes.fontSizeLg + 5,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign:
                                      TextAlign.right, // Right-align the text
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.lightGreen.shade100,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ZSizes.cardRadiusSm),
                      ),
                      margin: const EdgeInsets.all(ZSizes.md),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(ZSizes.cardRadiusSm),
                        splashColor: Colors.green.shade300,
                        onTap: () {
                          ZHelperFunctions.navigateToScreen(context, RelaxationScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(ZSizes.md),
                          child: Row(
                            children: [
                              // Image on the left
                              Image(
                                // height: 120,
                                width:
                                    120, // Add a fixed width for consistent sizing
                                image: AssetImage(ZImages.exerciseFeature),
                              ),
                  
                              // Text on the right
                              Expanded(
                                child: Text(
                                  'Exercise',
                                  style: TextStyle(
                                    color: ZColors.black,
                                    fontSize: ZSizes.fontSizeLg + 5,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign:
                                      TextAlign.right, // Right-align the text
                                ),
                              ),
                            ],
                          ),
                        ),
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
