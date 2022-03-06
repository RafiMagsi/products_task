import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          title: Text("Manage Products", style: TextStyle(color: AppColors.textBlack)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
        ),
        preferredSize: preferredSize);
  }
}
