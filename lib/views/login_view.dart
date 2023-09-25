import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigma/views/widgets/login_widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
