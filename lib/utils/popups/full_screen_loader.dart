import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_packet/common/widgets/loaders/animation_loader.dart';
import 'package:send_packet/utils/constants/colors.dart';

class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything
  /// Parameters:
  ///  ⁠text: The text to be displayed in the loading dialog.
  ///  animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    TAnimationLoaderWidget(text: text, animation: animation)
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
