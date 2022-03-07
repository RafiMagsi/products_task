import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Controllers/add_product_controller.dart';
import 'package:get/get.dart';

class FormTemplate extends GetView<AddProductController> {
  final GlobalKey<FormState>? formKey;
  final List<Widget>? formFields;
  final Widget? submitButton;

  const FormTemplate({
    Key? key,
    this.formKey,
    this.formFields,
    this.submitButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.productForm,
      child: Column(
        children: [
          SizedBox(height: AppSizes.xLargeSpacing),
          Column(children: formFields?.toList() ?? [Container()]),
          SizedBox(height: AppSizes.largeSpacing),
          submitButton ?? Container(),
        ],
      ),
    );
  }
}
