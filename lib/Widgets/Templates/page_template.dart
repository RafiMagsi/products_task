import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Controllers/products_controller.dart';
import 'package:products_task/Widgets/custom_app_bar.dart';
import 'package:get/get.dart';

// Manage products page
class PageTemplate extends GetView<ProductsController> {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final String? pageTitle;
  final bool? rootPage;

  const PageTemplate({Key? key, this.body, this.header, this.footer, this.pageTitle = "", this.rootPage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: pageTitle, rootPage: rootPage),
      body: Stack(
        children: [
          Column(
            children: [header ?? Container(), Expanded(child: body!)],
          ),
          Positioned(
            bottom: AppSizes.largeSpacing_2,
            left: 0,
            right: 0,
            child: footer ?? Container(),
          )
        ],
      ),
    );
  }
}
