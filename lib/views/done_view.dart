import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/views/login_view.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_button.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_upper_container.dart';
import 'package:sigma/views/widgets/sheared_widgets/some_icons.dart';

import '../generated/l10n.dart';

class DoneView extends StatelessWidget {
  const DoneView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Scaffold(
      body: Column(
        children: [
          const CustomUpperContainer(langIcon: LanguageIcon(), navigatorIcon: NavigatorIcon()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80.w),
            child: Image.asset("assets/images/undraw_completed_03xt (1) 1.png"),
          ),
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginView()));
              },
              child: CustomButtonChild(title: lang.DONE, fontSize: 30, width: 250, height: 60))
        ],
      ),
    );
  }
}