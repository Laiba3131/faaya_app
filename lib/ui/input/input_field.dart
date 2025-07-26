import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';
import '../../constants/asset_paths.dart';
import '../../utils/validators/validators.dart';
import '../widgets/password_suffix_widget.dart';

class InputField extends StatefulWidget {
  InputField(
      {required this.controller,
      required this.label,
      this.textInputAction,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.onFieldSubmitted,
      this.obscureText = false,
      this.suffixIcon,
      this.suffix,
      this.prefixIcon,
      this.maxLines = 1,
      this.fillColor,
      this.inputFormatters,
      this.readOnly = false,
      this.onTap,
      this.autoFocus = false,
      super.key,
      this.onChange,
      this.borderColor,
      this.borderRadius = 6,
      this.fontSize = 14,
      this.boxConstraints = 44,
      this.fontWeight = FontWeight.w400,
      this.horizontalPadding = 20,
      this.verticalPadding = 14,
      this.suffixIconTopPadding = 16,
      this.suffixIconRightPadding = 25,
      this.labelColor = Colors.grey,
      this.lMargin = 25,
      this.rMargin = 8,
      this.focusNode});

  final TextEditingController controller;
  final String label;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool autoFocus;
  final Function(String)? onChange;
  final Color? borderColor;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final double boxConstraints;
  final double suffixIconTopPadding;
  final double suffixIconRightPadding;
  final FontWeight fontWeight;
  final Color labelColor;
  final double lMargin;
  final double rMargin;
  var focusNode;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    final validator =
        widget.validator ?? Validators.getValidator(widget.keyboardType);

    return Stack(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
          validator: validator,
          enabled: true,
          onTap: widget.onTap,
          autofocus: widget.autoFocus,
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget.maxLines,
          focusNode: widget.focusNode,
          onChanged: widget.onChange,
          cursorColor:AppColors.white,
          decoration: InputDecoration(
            hintText: widget.label,
            labelStyle: TextStyle(
color: Colors.white,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                fontFamily: AssetPaths.roboto),
            hintStyle: TextStyle(
                color: widget.labelColor,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                fontFamily: AssetPaths.roboto),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
              ),
            ),
            filled: true,
            fillColor: widget.fillColor,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
              vertical: widget.verticalPadding,
            ),
            prefixIcon: Container(
              margin:
                  EdgeInsets.only(left: widget.lMargin, right: widget.rMargin),
              child: widget.prefixIcon,
            ),
            prefixIconConstraints: BoxConstraints(
              maxWidth: widget.boxConstraints,
              maxHeight: widget.boxConstraints,
            ),
            suffix: widget.suffix,
          ),
        ),
        Positioned(
          right: widget.suffixIcon is IconButton ||
                  widget.suffixIcon is PasswordSuffixIcon
              ? 6
              : widget.suffixIconRightPadding,
          top: widget.suffixIcon is IconButton ||
                  widget.suffixIcon is PasswordSuffixIcon
              ? 0
              : widget.suffixIconTopPadding,
          child: Align(
            alignment: Alignment.centerRight,
            child: widget.suffixIcon,
          ),
        )
      ],
    );
  }
}
