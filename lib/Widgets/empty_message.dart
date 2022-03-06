import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("No products found"));
  }
}
