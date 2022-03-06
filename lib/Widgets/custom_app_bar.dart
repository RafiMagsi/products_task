import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';

// Custom AppBar class
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // Title of the AppBar
  final bool? rootPage;
  const CustomAppBar({Key? key, this.title, this.rootPage = false}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          leading: !rootPage!
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : SizedBox(),
          backgroundColor: AppColors.background,
          title: Text(title ?? "", style: TextStyle(color: AppColors.textBlack)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
        ),
        preferredSize: preferredSize);
  }
}
