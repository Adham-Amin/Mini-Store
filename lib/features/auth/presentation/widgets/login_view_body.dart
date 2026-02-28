// ignore_for_file: use_build_context_synchronously

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:mini_store/core/functions/validators.dart';
import 'package:mini_store/core/services/secure_storage.dart';
import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/core/widgets/custom_button.dart';
import 'package:mini_store/core/widgets/custom_loading.dart';
import 'package:mini_store/core/widgets/custom_snack_bar.dart';
import 'package:mini_store/core/widgets/height_sized.dart';
import 'package:mini_store/features/auth/presentation/views/login_phone_view.dart';
import 'package:mini_store/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:mini_store/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:mini_store/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isLoading = false;
  late String email, password;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _login() async {
    if (!formKey.currentState!.validate()) {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
      return;
    }

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
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeightSized(height: 200),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'تسجيل الدخول إلى حسابك',
                style: AppStyles.textSemiBold32,
              ),
            ),
            HeightSized(height: 6),
            Text(
              'سعداء برؤيتك مرة أخرى.',
              style: AppStyles.textRegular16.copyWith(
                color: AppColors.secondary,
              ),
            ),
            HeightSized(height: 24),
            Text('البريد الألكتروني', style: AppStyles.textMedium16),
            HeightSized(height: 4),
            CustomTextFormField(
              onSaved: (user) => email = user!,
              hintText: 'البريد الألكتروني',
              validator: Validators.email,
            ),
            HeightSized(height: 16),
            Text('كلمة المرور', style: AppStyles.textMedium16),
            HeightSized(height: 4),
            CustomTextFormField(
              onSaved: (pass) => password = pass!,
              isPassword: true,
              hintText: 'كلمة المرور',
              validator: Validators.password,
            ),
            HeightSized(height: 48),
            isLoading
                ? const CustomLoading()
                : CustomButton(title: 'تسجيل الدخول', onPressed: _login),
            HeightSized(height: 32),
            Center(
              child: CustomTextRich(
                textOne: 'تسجيل برقم ',
                textTwo: 'الهاتف',
                onTap: () {
                  Navigator.pushNamed(context, LoginPhoneView.routeName);
                },
              ),
            ),
            HeightSized(height: 12),
          ],
        ),
      ),
    );
  }
}
