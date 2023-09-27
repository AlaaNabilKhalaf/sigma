import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_button.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_upper_container.dart';
import 'package:sigma/views/widgets/sheared_widgets/some_icons.dart';
import '../../../generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Expanded(
            child: CustomUpperContainer(
              langIcon: LanguageIcon(),
              navigatorIcon: NavigatorIcon(),
            ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Image.asset("assets/images/4137379-removebg-preview 1.png"),
              SizedBox(height: 10.h,),
              CustomButtonChild(title: lang.QrScanner, fontSize:30 , width: 250.w, height: 56),
            ],
          ),
        )
      ],
    );
  }
}
