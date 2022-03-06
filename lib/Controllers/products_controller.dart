import 'package:get/get.dart';
import 'package:products_task/Models/product_model.dart';

// Products GetX Controller for managing state and data
class ProductsController extends GetxController {
  // List of the products
  var productsList = RxList<ProductModel>();

  @override
  void onInit() {
    super.onInit();

    if (productsList.isEmpty) {
      // Checking if there is no data then add the sample data
      productsList.add(ProductModel(name: "Strawberry Cake", description: "Strawberry cake with cream", price: 123));
      productsList.add(ProductModel(name: "Strawberry Cake", description: "Strawberry cake with cream", price: 123));
      productsList.add(ProductModel(name: "Strawberry Cake", description: "Strawberry cake with cream", price: 123));
      productsList.add(ProductModel(name: "Strawberry Cake", description: "Strawberry cake with cream", price: 123));
      productsList.add(ProductModel(name: "Strawberry Cake", description: "Strawberry cake with cream", price: 123));
    }
  }
}
