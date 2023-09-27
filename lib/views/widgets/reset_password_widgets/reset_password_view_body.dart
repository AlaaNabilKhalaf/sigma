import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/constance.dart';
import 'package:sigma/cubit/layout_cubit/layout_cubit.dart';
import 'package:sigma/cubit/layout_cubit/layout_states.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_button.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text_field.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_upper_container.dart';
import 'package:sigma/views/widgets/sheared_widgets/some_icons.dart';

import '../../../generated/l10n.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit , LayoutStates>(builder: (context , state ){
      final cubit = BlocProvider.of<LayoutCubit>(context);
      final lang = S.of(context);
      return SingleChildScrollView(
        child: Column(
          children: [
            const CustomUpperContainer(langIcon: LanguageIcon(),
                navigatorIcon: NavigatorIconForResetPassView()),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w , vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h,),
                  CustomText(text: lang.OldPassword, fontSize: 18, textColor: blackColor),
                  CustomTextField(controller: cubit.oldPassController ),
                  SizedBox(height: 25.h,),
                  CustomText(text: lang.NewPassword, fontSize: 18, textColor: blackColor),
                  CustomTextField(controller: cubit.newPassController ),
                  SizedBox(height: 25.h,),
                  CustomText(text: lang.ConNewPassWord, fontSize: 18, textColor: blackColor),
                  CustomTextField(controller: cubit.newPassConController ),
                  SizedBox(height: 65.h,),
                  CustomButtonChild(title: lang.ResetPassword, fontSize: 30, width: 300.w, height: 60),
                ],
              ),
            ),
          ],
        ),
      );
    },
        listener: (context , state){});
  }
}
