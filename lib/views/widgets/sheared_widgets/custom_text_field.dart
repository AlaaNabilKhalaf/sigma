import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constance/colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller
  });
  final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h ,),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
            borderSide:   BorderSide(width: 2.w, color: primeColor1),
              borderRadius: BorderRadius.circular(15.r),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide:
                BorderSide(width: 2.w, color: primeColor1))),
      ),
    );
  }
}
