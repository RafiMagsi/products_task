import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/app_strings.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Models/product_model.dart';
import 'package:get/get.dart';

// Product item widget
class ProductItem extends StatelessWidget {
  final ProductModel? product;
  const ProductItem({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: AppSizes.mediumSpacing),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.mediumSpacing_2)),
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(Get.isDarkMode ? 0.05 : 0.15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.mediumSpacing_2, horizontal: AppSizes.mediumSpacing),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product!.name!,
              textAlign: TextAlign.start,
            ),
            Text(
              product!.description!,
              textAlign: TextAlign.start,
              style: Get.theme.textTheme.subtitle2,
            ),
            Text(
              product!.price!.toString() + " " + AppStrings.currency,
              textAlign: TextAlign.start,
              style: AppStyles.priceStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
