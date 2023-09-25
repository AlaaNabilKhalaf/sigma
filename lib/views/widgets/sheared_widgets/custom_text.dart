import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
  required this.text,
    required this.fontSize,
    required this.textColor,
  });
final String text ;
  final double fontSize ;
  final Color textColor ;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
          fontSize: fontSize.sp,
          color: textColor ,
          fontFamily: 'Cairo',
       fontWeight: FontWeight.bold
      ),
    );
  }
}
