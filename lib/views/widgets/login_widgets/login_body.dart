import 'package:flutter/cupertino.dart';
import 'package:sigma/views/widgets/login_widgets/custom_login_container.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Group 2.png'),
            fit: BoxFit.cover)
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(child: Image.asset("assets/logos/LOGO.png"))),
          const Expanded(
              flex: 3,
              child: CustomLoginContainer())
        ],
      ),

    );
  }
}
