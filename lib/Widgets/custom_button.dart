import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool? enabled;
  const CustomButton({
    Key? key,
    this.title = "",
    this.onTap,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.largeSpacing),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled! ? AppColors.primary : AppColors.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppSizes.largeSpacing_2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Text(
          title!,
          style: AppStyles.titleStyle(color: AppColors.white, height: 1),
        ),
      ),
      onPressed: () {
        onTap?.call();
      },
    );
  }
}
