import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_sizes.dart';

class EmptyMessage extends StatelessWidget {
  final String? message;
  const EmptyMessage({Key? key, this.message = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Icon(Icons.error_outline),
        SizedBox(height: AppSizes.largeSpacing),
        Text(message!),
      ],
    ));
  }
}
