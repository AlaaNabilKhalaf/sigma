import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/constance.dart';

class CustomUpperContainer extends StatelessWidget {
  const CustomUpperContainer({
    super.key,
    required this.langIcon,
    required this.navigatorIcon,
  });

  final Widget langIcon ;
  final Widget navigatorIcon ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Image.asset("assets/images/Group 6.png",
        fit: BoxFit.fill,
        height: 170.h,),
        Positioned(
          top: 55.h,
          left: 20.w,
          child: Image.asset("assets/logos/LOGO.png",
          height: 85.h,
          ),
        ),
         Positioned(top: 45.h,
        right: 60.w,child: langIcon ,),
         Positioned(top: 37.h,
          right: 20.w,child: navigatorIcon)
      ],
    );
  }
}
