import 'package:get/get.dart';
import 'package:products_task/Bindings/manage_products.dart';

class AppPages {
  static const initial = '/manage_products';
  static final appPages = [
    GetPage(
      name: '/manage_products',
      page: () => const ManageProducts(),
      binding: ProductsBinding(),
    ),
  ];
}

class ProductsBinding implements Bindings {
  @override
  void dependencies() {}
}
