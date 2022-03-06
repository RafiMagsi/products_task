import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/app_strings.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Controllers/add_product_controller.dart';
import 'package:products_task/Widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:products_task/Widgets/custom_button.dart';
import 'package:products_task/Widgets/custom_text_field.dart';

class AddProduct extends GetView<AddProductController> {
  const AddProduct({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    controller.productForm = GlobalKey<FormState>();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Product"),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Form(
            key: controller.productForm,
            child: Column(
              children: [
                SizedBox(height: AppSizes.xLargeSpacing),
                CustomTextField(
                  placeHolder: "Product Name",
                  inputController: controller.nameController,
                ),
                CustomTextField(
                  placeHolder: "Product Description",
                  inputController: controller.descriptionController,
                ),
                CustomTextField(
                  placeHolder: "Product Price",
                  inputController: controller.priceController,
                  suffix: Text(AppStrings.currency, style: AppStyles.hintStyle()),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                Obx(
                  () => CustomButton(
                    title: "Submit",
                    enabled: controller.buttonEnabled.value,
                    onTap: () {
                      if (controller.buttonEnabled.value) {
                        controller.submitProduct();
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
