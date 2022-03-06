import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_task/Configs/app_pages.dart';
import 'package:products_task/Helpers/dialog_helper.dart';
import 'package:products_task/Helpers/session_manager.dart';
import 'package:products_task/Models/product_model.dart';

class AddProductController extends GetxController {
  var productForm = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
  var buttonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();

    nameController.addListener(checkButton);
    descriptionController.addListener(checkButton);
    priceController.addListener(checkButton);
  }

  void submitProduct() {
    if (productForm.currentState!.validate()) {
      var session = SessionManager();
      var products = session.getProducts();
      products ??= <ProductModel>[];

      var product = ProductModel(
        name: nameController.text,
        description: descriptionController.text,
        price: int.parse(priceController.text),
      );

      products.insert(0, product);
      session.saveProducts(products);
      if (kDebugMode) {
        print("Products" + products.length.toString());
      }

      Get.offAndToNamed(AppPages.initial);
      DialogHelper.showSnackBar("", "Product was added successfully");
    }
  }

  checkButton() {
    if (nameController.text.isNotEmpty && descriptionController.text.isNotEmpty && priceController.text.isNotEmpty) {
      buttonEnabled(true);
    } else {
      buttonEnabled(false);
    }
  }
}
