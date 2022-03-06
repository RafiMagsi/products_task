import 'dart:convert';

import 'package:get/get.dart';
import 'package:products_task/Helpers/storage_manager.dart';
import 'package:products_task/Models/product_model.dart';

class SessionManager extends GetxController {
  saveProducts(List<ProductModel> products) {
    StorageManager.setString(
      StorageManager.products,
      json.encode(
        productsToJson(products),
      ),
    );
  }

  List<ProductModel>? getProducts() {
    List<ProductModel> products;
    var productJson = StorageManager.getString(StorageManager.products);
    if (productJson.isEmpty) return null;
    products = productsFromJson(jsonDecode(productJson));
    return products;
  }
}
