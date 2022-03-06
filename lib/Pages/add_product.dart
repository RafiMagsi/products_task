import 'package:flutter/material.dart';
import 'package:products_task/Widgets/custom_app_bar.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Product"),
    );
  }
}
