import 'package:flutter/material.dart';
import 'package:zenchatai/main.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';
import 'package:zenchatai/utils/logging/logger.dart';

class Greet extends StatelessWidget {
  const Greet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;
    var fName;

    if (user?.appMetadata['provider'] != "email") {
      fName = user!.userMetadata?["full_name"] ?? "Guest";
    } else {
      // Added dummy user string just for development
      // it should never be dummy.
      fName = "Guest";
    }

    fName = ZHelperFunctions.getFirstName(fName);

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
