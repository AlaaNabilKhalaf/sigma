import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigma/views/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){

    Future.delayed(const Duration(seconds:5),(){

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
