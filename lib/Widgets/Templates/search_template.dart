import 'package:flutter/material.dart';
import 'package:products_task/Widgets/custom_text_field.dart';

// Search text field, we can add search criteria in onChange event
class SearchTemplate extends StatelessWidget {
  final String? Function(String)? onChange;

  const SearchTemplate({
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      placeHolder: "Search Products",
      inputController: TextEditingController(),
      autoValidate: false,
      onChanged: onChange,
    );
  }
}
