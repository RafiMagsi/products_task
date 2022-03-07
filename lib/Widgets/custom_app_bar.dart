import 'package:flutter/material.dart';

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
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : SizedBox(),
          title: Text(title ?? ""),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
        ),
        preferredSize: preferredSize);
  }
}
