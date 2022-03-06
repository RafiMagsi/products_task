import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Card(elevation: 8, child: Center(child: Text("No products found"))));
  }
}
