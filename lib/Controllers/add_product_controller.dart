import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_task/Configs/app_pages.dart';

class AddProductController extends GetxController {
  var productForm = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();

  void submitProduct() {
    if (productForm.currentState!.validate()) {
      Get.offAndToNamed(AppPages.initial);
    }
  }
}
