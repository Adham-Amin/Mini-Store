import 'package:flutter/material.dart';
import 'package:mini_store/features/auth/presentation/widgets/verify_phone_view_bod.dart';

class VerifyPhoneView extends StatelessWidget {
  const VerifyPhoneView({super.key, required this.phone});

  static const routeName = '/verify-phone';
  final String phone;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: VerifyPhoneViewBody(phone: phone),
      
    );
  }
}
