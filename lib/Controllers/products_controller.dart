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

  // Search the given string in products list
  Future<String?> searchProducts({String? search = ""}) async {
    getProducts().then((pro) {
      if (search!.isNotEmpty) {
        if (kDebugMode) {
          print("Searching: " + search);
        }
        List<ProductModel> searchListData = <ProductModel>[];
        // Filter the items which matches with the name, description or price
        searchListData = productsList.where((item) {
          return item.name!.toLowerCase().contains(search.toLowerCase()) ||
              item.description!.toLowerCase().contains(search.toLowerCase()) ||
              item.price.toString().contains(search.toLowerCase());
        }).toList();
        // Post the filtered items to Product list
        // GetX will updates the view to show latest results
        productsList.value = searchListData;
      }
    });
  }
}
