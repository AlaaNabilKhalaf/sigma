import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
  required this.text,
    required this.fontSize,
    required this.textColor,
     this.textAlign = TextAlign.start,
  });
final String text ;
  final double fontSize ;
  final Color textColor ;
  final TextAlign textAlign ;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize.sp,
          color: textColor ,
          fontFamily: 'Cairo',
       fontWeight: FontWeight.bold
      ),
    );
  }
}
