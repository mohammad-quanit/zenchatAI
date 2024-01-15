import 'package:flutter/material.dart';
import 'package:zenchatai/utils/constants/sizes.dart';

class ZSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ZSizes.appBarHeight / 2,
    left: ZSizes.defaultSpace,
    bottom: ZSizes.defaultSpace,
    right: ZSizes.defaultSpace,
  );
}
