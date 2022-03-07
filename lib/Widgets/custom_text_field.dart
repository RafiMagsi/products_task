import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Helpers/validators.dart';

// Customized text field to be used for different purposes
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
  final bool? autoValidate;

  const CustomTextField({
    Key? key,
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
    this.onSubmitted,
    this.autoValidate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSizes.mediumSpacing_2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.largeSpacing_2),
        boxShadow: AppStyles.boxShadow(),
      ),
      clipBehavior: Clip.antiAlias,
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
        autovalidateMode: autoValidate! ? AutovalidateMode.onUserInteraction : null,
        controller: inputController,
        inputFormatters: inputFormatters,
        autocorrect: false,
        decoration: decoration ??
            InputDecoration(
              hintText: placeHolder ?? '${'Enter'} $title',
              contentPadding: EdgeInsetsDirectional.all(14),
              errorStyle: AppStyles.errorTextStyle().copyWith(height: 1.2),
              counterText: '',
              isDense: true,
              suffixIconConstraints: BoxConstraints(minWidth: 40, maxHeight: 40),
              suffixIcon: suffix,
            ),
        maxLength: maxLength!,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        focusNode: focusNode,
        onFieldSubmitted: onSubmitted,
      ),
    );
  }
}
