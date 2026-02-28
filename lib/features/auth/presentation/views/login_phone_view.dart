import 'package:flutter/material.dart';
import 'package:mini_store/features/auth/presentation/widgets/login_phone_view_body.dart';

class LoginPhoneView extends StatelessWidget {
  const LoginPhoneView({super.key});
  
  static const String routeName = '/loginPhoneViewBody';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(child: const LoginPhoneViewBody()),
    );
  }
}
