import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Controllers/products_controller.dart';
import 'package:products_task/Models/product_model.dart';
import 'package:products_task/Widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProductsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom: AppSizes.buttonHeight_2 * 2),
        itemCount: controller.productsList.length,
        itemBuilder: (BuildContext context, int index) {
          ProductModel product = controller.productsList.elementAt(index);
          return ProductItem(product: product);
        });
  }
}
