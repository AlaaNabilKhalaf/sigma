import 'package:flutter/material.dart';
import 'package:sigma/views/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState(){

    Future.delayed(const Duration(seconds:3),(){

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=> const LoginView()));


    });



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/first.png",),
            fit: BoxFit.fill)
    ),

  ),
);
  }
}
