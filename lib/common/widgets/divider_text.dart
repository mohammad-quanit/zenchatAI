import 'package:flutter/material.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class ZDivider extends StatelessWidget {
  const ZDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final isDark = ZHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isDark ? ZColors.darkGrey : ZColors.grey,
            thickness: 0.5,
            indent: 40,
            endIndent: 5,
          ),
        ),
        Text(dividerText,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .color!
                    .withOpacity(0.6))),
        Flexible(
          child: Divider(
            color: isDark ? ZColors.darkGrey : ZColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 40,
          ),
        )
      ],
    );
  }
}
