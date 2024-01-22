// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenchatai/common/widgets/app_bar.dart';
import 'package:zenchatai/features/home/screens/widgets/notifications.dart';
import 'package:zenchatai/features/home/screens/widgets/primary_header.dart';

import 'package:zenchatai/main.dart';

import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
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

    // Added dummy user string just for development
    // it should never be dummy.
    final String fName = ZHelperFunctions.getFirstName(
        user?.userMetadata?['full_name'] ?? "Dummy");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hi User Text
        Text('Hi, $fName',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: ZColors.grey)),
        const SizedBox(height: 5),
        Text(
          ZTexts.homeAppbarSubTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: ZColors.grey),
        ),
      ],
    );
  }
}
