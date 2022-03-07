import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_task/Configs/app_strings.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Controllers/add_product_controller.dart';
import 'package:products_task/Widgets/Templates/form_template.dart';
import 'package:products_task/Widgets/Templates/page_template.dart';
import 'package:get/get.dart';
import 'package:products_task/Widgets/custom_button.dart';
import 'package:products_task/Widgets/custom_text_field.dart';

// Ads a product to storage
// Three fields are required to be filled to process the add feature
// Page template and Form template are used
class AddProduct extends GetView<AddProductController> {
  const AddProduct({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    controller.productForm = GlobalKey<FormState>();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Add Product",
      body: FormTemplate(
        formKey: controller.productForm,
        formFields: [
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
            textInputType: TextInputType.number,
          ),
        ],
        submitButton: Obx(
          () => CustomButton(
            title: "Submit",
            // Changes the color of the button depending on the status of validation of text fields
            enabled: controller.buttonEnabled.value,
            onTap: () {
              if (controller.buttonEnabled.value) {
                controller.submitProduct();
              }
            },
          ),
        ),
      ),
    );
  }
}
