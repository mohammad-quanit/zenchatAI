import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
