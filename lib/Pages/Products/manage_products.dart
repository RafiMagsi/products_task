import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_pages.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Controllers/products_controller.dart';
import 'package:products_task/Pages/Products/products_list.dart';
import 'package:products_task/Widgets/Templates/page_template.dart';
import 'package:products_task/Widgets/Templates/search_template.dart';
import 'package:products_task/Widgets/custom_button.dart';
import 'package:products_task/Widgets/empty_message.dart';
import 'package:get/get.dart';

// Manage products page
class ManageProducts extends GetView<ProductsController> {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.getProducts();
    });
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Manage Products",
      header: SearchTemplate(
        onChange: (value) {
          controller.searchProducts(search: value);
        },
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return controller.getProducts();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
            child: Obx(
              () => controller.productsList.isNotEmpty
                  ? ProductsListView(controller: controller)
                  : EmptyMessage(message: "No products found"),
            )),
      ),
      rootPage: true,
      footer: CustomButton(
        title: "Add Product",
        onTap: () async {
          await Get.toNamed(AppPages.addProduct);
          controller.getProducts();
        },
      ),
    );
  }
}
