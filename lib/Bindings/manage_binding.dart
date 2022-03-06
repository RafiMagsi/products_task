import 'package:get/get.dart';
import 'package:products_task/Controllers/products_controller.dart';

// Products binding to initialize all the required controllers at once before using
class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController(), fenix: true);
  }
}
