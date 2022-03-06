import 'package:get/get.dart';
import 'package:products_task/Bindings/manage_binding.dart';
import 'package:products_task/Pages/manage_products.dart';

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
