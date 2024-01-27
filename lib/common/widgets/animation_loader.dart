import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';

class ZAnimationLoader extends StatelessWidget {
  const ZAnimationLoader(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), // Display lottie animation
          const SizedBox(
            height: ZSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: ZSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: ZColors.light),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
