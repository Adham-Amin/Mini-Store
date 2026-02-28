import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_store/core/services/secure_storage.dart';
import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/core/widgets/custom_button.dart';
import 'package:mini_store/core/widgets/custom_loading.dart';
import 'package:mini_store/core/widgets/custom_snack_bar.dart';
import 'package:mini_store/core/widgets/height_sized.dart';
import 'package:mini_store/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:mini_store/features/auth/presentation/widgets/pin_section.dart';
import 'package:mini_store/features/main/presentation/views/main_view.dart';

class VerifyPhoneViewBody extends StatefulWidget {
  const VerifyPhoneViewBody({super.key, required this.phone});

  final String phone;

  @override
  State<VerifyPhoneViewBody> createState() => _VerifyPhoneViewBodyState();
}

class _VerifyPhoneViewBodyState extends State<VerifyPhoneViewBody> {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _login() async {
    formKey.currentState!.save();
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await SecureStorage.write(key: 'token', value: 'token');
    customSnackBar(
      context: context,
      message: 'أهلاً بعودتك 👋',
      type: AnimatedSnackBarType.success,
    );
    Navigator.pushReplacementNamed(context, MainView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            HeightSized(height: 40),
            Icon(Icons.sms_outlined, color: Color(0xffAFAFAF), size: 36.w),
            HeightSized(height: 20),
            Text('تأكيد رقم الهاتف', style: AppStyles.textSemiBold32),
            HeightSized(height: 16),
            Text(
              'من فضلك أدخل رمز التحقق المرسل إلى\n(${widget.phone})',
              textAlign: TextAlign.center,
              style: AppStyles.textRegular16.copyWith(color: AppColors.secondary),
            ),
            HeightSized(height: 40),
            PinSection(onCompleted: (code) {}),
            HeightSized(height: 20),
            CustomTextRich(
              textOne: 'لم تستلم الرمز؟ ',
              textTwo: 'إعادة الإرسال',
              onTap: () {
                customSnackBar(
                  context: context,
                  message: 'تم إرسال الرمز مرة أخرى بنجاح',
                  type: AnimatedSnackBarType.success,
                );
              },
            ),
            HeightSized(height: 40),
            isLoading
                ? const CustomLoading()
                : CustomButton(title: 'تسجيل الدخول', onPressed: _login),
            HeightSized(height: 32),
          ],
        ),
      ),
    );
  }
}
