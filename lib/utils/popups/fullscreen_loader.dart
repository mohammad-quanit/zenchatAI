import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/common/widgets/animation_loader.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

/// Utility class for managing a full screen loading
class ZFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(

        /// use Get.overlayContext for overlay dialogs
        context: Get.overlayContext!,

        /// The dialog cant be dismissed by outside tap
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false, // disable popping with back btn
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: ZHelperFunctions.isDarkMode(Get.context!)
                  ? ZColors.dark
                  : ZColors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250, // adjusting space as needed
                  ),
                  ZAnimationLoader(text: text, animation: animation),
                ],
              ),
            )));
  }

  /// stop the currently open loading dialog
  static stopLoading() {
    // close the dialog using the navigator
    Navigator.of(Get.overlayContext!).pop();
  }
}
