import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel? product;
  const ProductItem({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            product!.name!,
            textAlign: TextAlign.start,
            style: AppStyles.titleStyle(),
          ),
          Text(
            product!.description!,
            textAlign: TextAlign.start,
            style: AppStyles.subTitleStyle(),
          ),
          Text(
            product!.price!.toString(),
            textAlign: TextAlign.start,
            style: AppStyles.priceStyle(),
          ),
          Container(),
        ],
      ),
    );
  }
}
