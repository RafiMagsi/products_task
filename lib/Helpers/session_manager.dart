import 'dart:convert';

import 'package:get/get.dart';
import 'package:products_task/Helpers/storage_manager.dart';
import 'package:products_task/Models/product_model.dart';
import 'package:dio/dio.dart';

// Session manager controls the data to and from the storage
class SessionManager extends GetxController {
  saveProducts(List<ProductModel> products) {
    StorageManager.setString(
      StorageManager.products,
      json.encode(
        productsToJson(products),
      ),
    );
  }

  Future<List<ProductModel>?> getProducts() async {
    List<ProductModel> products;
    var productJson = StorageManager.getString(StorageManager.products);
    if (productJson.isEmpty) return null;
    var jsonProducts = jsonDecode(productJson);
    products = productsFromJson(jsonProducts);
    return products;
  }

  Future<List<ProductModel>?> getProducts2() async {
    List<ProductModel> products;
    var data = await Dio().get("https://productstask-c9de8.web.app/bigben");

    var productJson = data.toString();
    if (productJson.isEmpty) return null;
    products = productsFromJson(jsonDecode(productJson));
    return products;
  }
}
