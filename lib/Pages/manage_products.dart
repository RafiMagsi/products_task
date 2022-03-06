import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Controllers/products_controller.dart';
import 'package:products_task/Models/product_model.dart';
import 'package:products_task/Widgets/custom_app_bar.dart';
import 'package:products_task/Widgets/product_item.dart';
import 'package:get/get.dart';

// Manage products page
class ManageProducts extends GetView<ProductsController> {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Manage Products"),
      body: Container(
        decoration: BoxDecoration(color: AppColors.background),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
        child: ListView.builder(
            itemCount: controller.productsList.length,
            itemBuilder: (BuildContext context, int index) {
              ProductModel product = controller.productsList.elementAt(index);
              return ProductItem(product: product);
            }),
      ),
    );
  }
}
