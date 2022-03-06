import 'package:get/get.dart';
import 'package:products_task/Helpers/session_manager.dart';
import 'package:products_task/Models/product_model.dart';

// Products GetX Controller for managing state and data
class ProductsController extends GetxController {
  // List of the products
  var productsList = RxList<ProductModel>();

  getProducts() async {
    // Checking if there is no data then initialize an empty list
    var session = SessionManager();
    var products = session.getProducts();
    products ??= <ProductModel>[];

    productsList.clear();
    productsList.value = products;
  }
}
