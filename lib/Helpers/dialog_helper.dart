import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Helpers/loading_dialog.dart';

class DialogHelper {
  void showLoading([String? loadingText]) {
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        return LoadingDialog(
          loadingText: loadingText ?? 'loading_message'.tr,
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, anim, secAnim, child) {
        return Transform.scale(
          scale: anim.value,
          child: child,
        );
      },
      barrierLabel: '',
      barrierDismissible: false,
    );
  }

  void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void showSnackBar(String title, String message, {IconData? iconData}) {
    Get.snackbar(
      title,
      message,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Get.theme.backgroundColor,
      borderRadius: 0,
      barBlur: 100,
      snackStyle: SnackStyle.FLOATING,
      maxWidth: Get.width,
      colorText: AppColors.popup,
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      messageText: Text(
        message,
        style: AppStyles.titleStyle(color: AppColors.popup),
      ),
      padding: const EdgeInsets.only(bottom: 10, top: 0),
      overlayColor: Colors.white,
      margin: EdgeInsets.zero,
      icon: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10),
        child: Icon(
          iconData ?? Icons.done,
          color: AppColors.popup,
          size: 20,
        ),
      ),
    );
  }
}
