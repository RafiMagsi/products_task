import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_pages.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Controllers/products_controller.dart';
import 'package:products_task/Pages/Products/products_list.dart';
import 'package:products_task/Widgets/custom_app_bar.dart';
import 'package:products_task/Widgets/custom_button.dart';
import 'package:products_task/Widgets/custom_text_field.dart';
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
    return Scaffold(
      appBar: CustomAppBar(title: "Manage Products", rootPage: true),
      body: Stack(
        children: [
          Column(
            children: [
              CustomTextField(
                placeHolder: "Search Products",
                inputController: controller.searchController,
                autoValidate: false,
              ),
              Expanded(
                child: RefreshIndicator(
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
              ),
            ],
          ),
          Positioned(
            bottom: AppSizes.largeSpacing_2,
            left: 0,
            right: 0,
            child: CustomButton(
              title: "Add Product",
              onTap: () => Get.toNamed(AppPages.addProduct),
            ),
          )
        ],
      ),
    );
  }
}
