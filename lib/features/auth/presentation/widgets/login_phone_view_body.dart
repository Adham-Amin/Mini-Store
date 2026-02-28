import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/core/widgets/custom_button.dart';
import 'package:mini_store/core/widgets/height_sized.dart';
import 'package:mini_store/features/auth/presentation/views/verify_phone_view.dart';

class LoginPhoneViewBody extends StatefulWidget {
  const LoginPhoneViewBody({super.key});

  @override
  State<LoginPhoneViewBody> createState() => _LoginPhoneViewBodyState();
}

class _LoginPhoneViewBodyState extends State<LoginPhoneViewBody> {
  final formKey = GlobalKey<FormState>();

  String completePhone = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSized(height: 40),
            Text('أدخل رقم هاتفك', style: AppStyles.textMedium16),
            HeightSized(height: 16),
            IntlPhoneField(
              initialCountryCode: 'SA',
              invalidNumberMessage: 'رقم الهاتف غير صحيح',
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'أدخل رقم الهاتف',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              validator: (value) =>
                  completePhone.isEmpty || completePhone.length < 9
                  ? 'ادخل رقم الهاتف'
                  : null,
              onChanged: (phone) {
                completePhone = phone.completeNumber;
              },
            ),
            HeightSized(height: 40),
            CustomButton(
              title: 'تسجيل الدخول برقم الهاتف',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Navigator.pushNamed(
                    context,
                    VerifyPhoneView.routeName,
                    arguments: completePhone,
                  );
                }
              },
            ),
            HeightSized(height: 32),
          ],
        ),
      ),
    );
  }
}
