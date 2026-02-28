import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:pinput/pinput.dart';

class PinSection extends StatelessWidget {
  const PinSection({super.key, this.onCompleted});

  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          separatorBuilder: (index) => SizedBox(width: 12.w),
          validator: (value) => value!.length == 4 ? null : 'رمز التحقق غير صحيح',
          length: 4,
          defaultPinTheme: PinTheme(
            width: 64.w,
            height: 54.h,
            textStyle: AppStyles.textMedium16,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.secondary.withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 64.w,
            height: 54.h,
            textStyle: AppStyles.textMedium16,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onCompleted: onCompleted,
        ),
      ),
    );
  }
}
