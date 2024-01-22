// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/common/widgets/app_bar.dart';
import 'package:zenchatai/features/home/screens/widgets/notifications.dart';
import 'package:zenchatai/features/home/screens/widgets/primary_header.dart';

import 'package:zenchatai/main.dart';

import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/device/device_utility.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
                child: Column(
              children: [
                ZCustomAppBar(
                  title: Column(
                    children: [Greet()],
                  ),
                  actions: [Notifications()],
                ),
              ],
            )),

            // SizedBox(
            //   height: ZSizes.spaceBtwSections,
            // ),

            // Search Bar Widget
            // Search()
          ],
        ),
      ),
    );
  }
}

class Greet extends StatelessWidget {
  const Greet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;
    final fName =
        ZHelperFunctions.getFirstName(user?.userMetadata?['full_name']);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hi User Text
        Text('Hi, $fName',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: ZColors.grey)),
        Text(
          ZHelperFunctions.getFormattedDate(DateTime.now()),
          style:
              Theme.of(context).textTheme.bodyLarge!.apply(color: ZColors.grey),
        ),
      ],
    );
  }
}
