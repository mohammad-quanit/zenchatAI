// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/common/widgets/circular_container.dart';
import 'package:zenchatai/common/widgets/curved_edges_container.dart';
import 'package:zenchatai/main.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ZColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(child: Container()),

            // SizedBox(
            //   height: ZSizes.spaceBtwSections,
            // ),

            // // Search Bar Widget
            // Search()
          ],
        ),
      ),
    );
  }
}

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesContainer(
      child: Container(
        color: ZColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: ZColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: ZColors.textWhite.withOpacity(0.1),
              ),
            ),
          ]),
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hi User Text
            Text('Hi, $fName',
                style: Theme.of(context).textTheme.headlineMedium),
            Text(
              ZHelperFunctions.getFormattedDate(DateTime.now()),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),

        // Notification
        Container(
          decoration: BoxDecoration(
              color: ZColors.textWhite.withOpacity(0.3),
              borderRadius: BorderRadius.circular(ZSizes.borderRadiusLg * 0.6)),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification1,
              color: ZColors.white,
            ),
          ),
        )
      ],
    );
  }
}
