import 'package:flutter/material.dart';
import 'package:mini_store/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginViewBody());
  }
}
