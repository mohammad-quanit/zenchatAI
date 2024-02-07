import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zenchatai/features/authentication/controllers/signup_controller.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class PolicyAgreement extends StatelessWidget {
  const PolicyAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = SignupController.instance;
    final isDarkMode = ZHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            height: ZSizes.lg,
            width: ZSizes.lg,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
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
                    color: isDarkMode ? ZColors.white : ZColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        isDarkMode ? ZColors.white : ZColors.primary,
                  )),
          TextSpan(
              text: '${ZTexts.and} ',
              style: Theme.of(context).textTheme.labelSmall),
          TextSpan(
              text: '${ZTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: isDarkMode ? ZColors.white : ZColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        isDarkMode ? ZColors.white : ZColors.primary,
                  )),
        ]))
      ],
    );
  }
}
