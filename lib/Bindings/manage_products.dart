import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Widgets/custom_app_bar.dart';

// Manage products page
class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Manage Products"),
      body: Container(
        decoration: BoxDecoration(color: AppColors.background),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.mediumSpacing_2),
                ),
                padding: EdgeInsets.symmetric(vertical: AppSizes.mediumSpacing_2, horizontal: AppSizes.mediumSpacing),
                margin: EdgeInsets.all(AppSizes.mediumSpacing),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Strawberry Cake",
                      textAlign: TextAlign.start,
                      style: AppStyles.titleStyle(),
                    ),
                    Text(
                      "Strawberry Cake with cream",
                      textAlign: TextAlign.start,
                      style: AppStyles.subTitleStyle(),
                    ),
                    Text(
                      "12 K.D",
                      textAlign: TextAlign.start,
                      style: AppStyles.priceStyle(),
                    ),
                    Container(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
