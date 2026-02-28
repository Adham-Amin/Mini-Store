import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    this.onTap,
    required this.textOne,
    required this.textTwo,
  });

  final Function()? onTap;
  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: textOne,
        style: AppStyles.textRegular16.copyWith(color: AppColors.secondary),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: textTwo,
            style: AppStyles.textRegular16.copyWith(
              color: AppColors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
