import 'package:flutter/material.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class PolicyAgreement extends StatelessWidget {
  const PolicyAgreement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = ZHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            height: ZSizes.lg,
            width: ZSizes.lg,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(
          width: ZSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${ZTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.labelSmall),
          TextSpan(
              text: '${ZTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: isDark ? ZColors.white : ZColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? ZColors.white : ZColors.primary,
                  )),
          TextSpan(
              text: '${ZTexts.and} ',
              style: Theme.of(context).textTheme.labelSmall),
          TextSpan(
              text: '${ZTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: isDark ? ZColors.white : ZColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? ZColors.white : ZColors.primary,
                  )),
        ]))
      ],
    );
  }
}
