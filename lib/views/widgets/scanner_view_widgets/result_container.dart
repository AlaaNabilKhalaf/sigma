import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../generated/l10n.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key , required this.barcode});
final Barcode? barcode ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: barcode == null
          ? Container(
        padding: const EdgeInsets.all(10).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: Colors.grey.shade100,
        ),
        child: Text(
          S.of(context).ScanACode,
          maxLines: 4,
        ),
      )
          : const SizedBox(),
    );
  }
}
