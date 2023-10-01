import 'package:flutter/material.dart';
import 'package:sigma/views/home_view.dart';
import 'package:sigma/views/login_view.dart';

import '../sheared/constance/cache_data.dart';



class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {


startTime();

    super.initState();
  }
startTime() async {
  Future.delayed(const Duration(milliseconds: 900),(){

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>  id != null && id != 0 ? const HomeView() : const LoginView()
        ));


  });
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
