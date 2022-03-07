import 'package:get/get.dart';
import 'package:products_task/Bindings/manage_binding.dart';
import 'package:products_task/Pages/Products/add_product.dart';
import 'package:products_task/Pages/Products/manage_products.dart';

// Pages and Route manager
// We can add more pages as required
// Each page has its binding to LazyLoad the GetXControllers
class AppPages {
  static const initial = '/manage_products';
  static const manageProducts = '/manage_products';
  static const addProduct = '/add_product';
  static final appPages = [
    GetPage(
      name: manageProducts,
      page: () => const ManageProducts(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: addProduct,
      page: () => const AddProduct(),
      binding: ProductsBinding(),
    ),
  ];
}
