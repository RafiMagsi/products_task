import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function? onTap;
  const CustomButton({
    Key? key,
    this.title = "",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppSizes.mediumSpacing_2),
        padding: EdgeInsets.all(AppSizes.mediumSpacing_2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.largeSpacing_2),
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
