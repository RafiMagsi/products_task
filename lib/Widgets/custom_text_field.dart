import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Helpers/validators.dart';

class CustomTextField extends StatelessWidget {
  final bool? disableInteraction;
  final String? Function(String p1)? onChanged;
  final String? Function(String p1)? validator;
  final String? errorText;
  final TextEditingController? inputController;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final String? placeHolder;
  final String? title;
  final Widget? suffix;
  final int? maxLength;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;

  const CustomTextField(
      {Key? key,
      this.onChanged,
      this.disableInteraction = false,
      this.validator,
      this.errorText,
      this.inputController,
      this.inputFormatters,
      this.decoration,
      this.placeHolder,
      this.title,
      this.suffix,
      this.maxLength = 100,
      this.textInputType,
      this.focusNode,
      this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSizes.mediumSpacing_2),
      child: Material(
        shadowColor: Colors.grey.shade300,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(AppSizes.largeSpacing_2),
        elevation: 8,
        child: TextFormField(
          enableInteractiveSelection: disableInteraction!,
          onChanged: (text) {
            if (onChanged != null) onChanged!(text);
          },
          validator: (x) {
            if (validator == null) {
              return Validators.validateField(x, errorMessage: errorText);
            } else {
              return validator!(x!);
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: inputController,
          inputFormatters: inputFormatters,
          autocorrect: false,
          decoration: decoration ??
              InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: Colors.white,
                focusColor: Colors.blue,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: placeHolder ?? '${'Enter'} $title',
                hintStyle: AppStyles.hintStyle().copyWith(height: 1),
                contentPadding: EdgeInsetsDirectional.only(top: 12, bottom: 12, start: 12),
                errorStyle: AppStyles.errorTextStyle().copyWith(height: 1.2),
                counterText: '',
                isDense: true,
                suffixIconConstraints: BoxConstraints(minWidth: 10, maxHeight: 40),
                suffix: suffix,
              ),
          maxLength: maxLength!,
          style: AppStyles.titleStyle(color: AppColors.textSubtitle),
          keyboardType: textInputType,
          textInputAction: TextInputAction.next,
          focusNode: focusNode,
          onFieldSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
