import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:products_task/Helpers/session_manager.dart';
import 'package:products_task/Models/product_model.dart';

// Products GetX Controller for managing state and data
class ProductsController extends GetxController {
  // List of the products
  var productsList = RxList<ProductModel>();

  var searchTextController = TextEditingController();

  getProducts() async {
    // Checking if there is no data then initialize an empty list
    var session = SessionManager();
    var products = await session.getProducts();
    products ??= <ProductModel>[];

    productsList.clear();
    productsList.value = products;
  }

  Future<String?> searchProducts({String? search = ""}) async {
    getProducts().then((pro) {
      if (search!.isNotEmpty) {
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
