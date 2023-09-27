// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// import '../../../constance.dart';
//
// class buildQrViewer extends StatelessWidget {
//   const buildQrViewer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  QRView(
//     key: qrKey,
//     onQRViewCreated: onQRViewCreated,
//     overlay: QrScannerOverlayShape(
//         cutOutSize: MediaQuery.of(context).size.width * 0.8,
//         borderRadius: 10.r,
//         borderColor: primeColor1,
//         borderLength: 10,
//         borderWidth: 20),
//   );
//   }
// }
//
//   void onQRViewCreated(QRViewController controller) {
//     setState(
//           () => this.controller = controller,
//
//     controller.scannedDataStream.listen((barcod) {
//       setState(() {
//         barcode = barcod;
//         qrGenerator();
//       });
//     });
//   }