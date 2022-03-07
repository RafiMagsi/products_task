import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_task/Configs/app_strings.dart';
import 'package:products_task/Helpers/dialog_helper.dart';
import 'package:products_task/Helpers/session_manager.dart';
import 'package:products_task/Helpers/validators.dart';
import 'package:products_task/Models/product_model.dart';

// GetXController for Add product page
class AddProductController extends GetxController {
  var productForm = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
  var buttonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Listener is added to all the text fields to check validations
    nameController.addListener(checkButton);
    descriptionController.addListener(checkButton);
    priceController.addListener(checkButton);
  }

  // Adds a product to Get Storage
  Future<void> submitProduct() async {
    // Validating form
    if (productForm.currentState!.validate()) {
      var session = SessionManager(); // Instance of session manager
      var products = await session.getProducts(); // Retrieve products with session
      products ??= <ProductModel>[]; // If product list is null then assign an empty list

      // Create Product Object with text field values
      var product = ProductModel(
        name: nameController.text,
        description: descriptionController.text,
        price: int.parse(priceController.text),
      );

      // Insert the product at the first index of list
      products.insert(0, product);
      // Save products to GetxStorage
      session.saveProducts(products);
      if (kDebugMode) {
        print("Products" + products.length.toString());
      }

      // Go back to Manage Products page
      Get.back();
      // Show Success Notification
      DialogHelper.showSnackBar("", AppStrings.productAdded);
    }
  }

  // Validate the Submit button, depending on the given conditions
  checkButton() {
    if (Validators.hasValidLength(nameController.text) &&
        Validators.hasValidLength(descriptionController.text) &&
        priceController.text.isNotEmpty) {
      buttonEnabled(true);
    } else {
      buttonEnabled(false);
    }
  }
}
