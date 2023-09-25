import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/constance.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  required this.title,
    required this.fontSize,
    required this.width,
    required this.height,
    required this.fun,
  });
final String title ;
final double height ;
final double width ;
  final double fontSize ;
  final Function fun ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              primeColor1,
              primeColor2
            ],
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        height: height.h,
        width: width.w,
        child: CustomText(
          textColor: whiteColor,
          text: title,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
