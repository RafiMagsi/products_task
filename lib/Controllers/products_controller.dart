import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_task/Helpers/session_manager.dart';
import 'package:products_task/Models/product_model.dart';

// Products GetX Controller for managing state and data
class ProductsController extends GetxController {
  // List of the products
  var productsList = RxList<ProductModel>();
  var searchController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    searchController.addListener(searchProducts);
  }

  getProducts() async {
    // Checking if there is no data then initialize an empty list
    var session = SessionManager();
    var products = await session.getProducts();
    products ??= <ProductModel>[];

    productsList.clear();
    productsList.value = products;
  }

  searchProducts() async {
    getProducts().then((pro) {
      var search = searchController.text;
      if (search.isNotEmpty) {
        if (kDebugMode) {
          print("Searching");
        }
        List<ProductModel> searchListData = <ProductModel>[];
        searchListData = productsList.where((item) => item.name!.toLowerCase().contains(search.toLowerCase())).toList();
        productsList.value = searchListData;
      }
    });
  }
}
