import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/views/login_view.dart';
import 'package:sigma/views/splash_view.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text.dart';
import '../../../constance.dart';
import '../../../generated/l10n.dart';

class LanguageIcon extends StatelessWidget {
  const LanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.language , color: whiteColor, size: 30,);
  }
}


class NavigatorIconForResetPassView extends StatelessWidget {
  const NavigatorIconForResetPassView ({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return
      DropdownButton<String>(
        icon: const Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
        iconSize: 30,
        underline: const SizedBox(
          height: 10,
        ),
        onChanged: (String? value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const LoginView()));
        },
        items: [
          DropdownMenuItem(
              value: '0',
              child: CustomText(text: "logout", fontSize: 15, textColor: blackColor,)
          ),
        ],
      );
    //Icon(Icons. , color: whiteColor, size: 30);
  }
}

class NavigatorIcon extends StatelessWidget {
  const NavigatorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return
      DropdownButton<String>(
        icon: const Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
        iconSize: 30,
        underline: const SizedBox(
          height: 10,
        ),
        onChanged: (String? value) {
          if(value == "0" ){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const LoginView()));
          }
          else{Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen()));}
        },
        items: [
          DropdownMenuItem(
              value: '0',
              child: CustomText(text: lang.ResetPassword, fontSize: 15, textColor: blackColor,)
          ),
          DropdownMenuItem(
              value: '1',
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
                  ),
                  child: CustomText(text: "log Out", fontSize: 15, textColor: blackColor,))
          ),
        ],
      );
    //Icon(Icons. , color: whiteColor, size: 30);
  }
}
