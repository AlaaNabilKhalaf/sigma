import 'package:flutter/material.dart';
import 'package:sigma/views/widgets/login_widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false ;
      },
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
