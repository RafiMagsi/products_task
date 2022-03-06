import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_colors.dart';

class LoadingDialog extends StatefulWidget {
  final String? loadingText;

  const LoadingDialog({Key? key, this.loadingText = "Loading.."}) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: AppColors.primary),
              Text(widget.loadingText ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
