import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    required this.hintText,
    this.onSaved,
    this.validator,
  });

  final bool isPassword;
  final String hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      style: AppStyles.textRegular16,
      obscureText: widget.isPassword ? isObscureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        hintText: 'أدخل ${widget.hintText}',
        hintStyle: AppStyles.textRegular16.copyWith(color: AppColors.secondary),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.secondary,
                ),
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
