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
// Page template and Search Templates are used
class ManageProducts extends GetView<ProductsController> {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    // CreateElement is required to refresh data each time view appears
    // Retrieve products from storage after completion of current frame
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // Retrieve products from storage
      controller.getProducts();
    });
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Manage Products",
      header: SearchTemplate(
        controller: controller.searchTextController,
        onChange: (value) {
          controller.searchProducts(search: value);
        },
      ),
      body: RefreshIndicator(
        // In case data is not loaded, pull to refresh the data
        onRefresh: () {
          return controller.getProducts();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
            child: Obx(
              () => controller.productsList.isNotEmpty
                  ? ProductsListView(controller: controller) // List controller for the products
                  : EmptyMessage(message: "No products found"), // Error message
            )),
      ),
      rootPage: true,
      footer: CustomButton(
        title: "Add Product",
        onTap: () async {
          // await Get.toNamed(AppPages.addProduct);
          // controller.searchTextController.text = "";
          controller.getProducts2();
        },
      ),
    );
  }
}
