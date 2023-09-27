import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sigma/constance.dart';
import 'package:sigma/cubit/layout_cubit/layout_cubit.dart';
import 'package:sigma/cubit/layout_cubit/layout_states.dart';
import 'package:sigma/views/done_view.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_button.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text_field.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_upper_container.dart';
import 'package:sigma/views/widgets/sheared_widgets/some_custom_icons.dart';

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
                  GestureDetector(
                      onTap: () async {
                        if (cubit.oldPassController.text.isEmpty ||
                            cubit.newPassController.text.isEmpty ||
                            cubit.newPassConController.text.isEmpty) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context)
                              .showSnackBar( SnackBar(
                            duration: const Duration(seconds: 3),
                            content:
                            Center(child: Text(lang.AllFieldsRequired)),
                          ));
                        } else if (cubit.newPassController.text !=
                            cubit.newPassConController.text) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context)
                              .showSnackBar( SnackBar(
                            duration: const Duration(seconds: 3),
                            content: Center(
                                child: Text(lang.NewPasswordsDoNotMatch)),
                          ));
                        } else if (cubit.newPassController.text ==
                            cubit.newPassConController.text &&
                            cubit.oldPassController.text.isNotEmpty) {
                          try{
                            await cubit.resetPassword(
                                oldPassword: cubit.oldPassController.text,
                                newPassword: cubit.newPassController.text);
                          }catch (e) {
                            cubit.passMassage = lang.SomethingWentWrong;
                          }
                          if (cubit.passMassage == "password has been changed") {
                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const DoneView()));
                          } else {
                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: lang.OPS,
                              desc: cubit.passMassage,
                              buttons: [
                                DialogButton(
                                  color: primeColor1,
                                  onPressed: () => Navigator.pop(context),
                                  width: 125.w,
                                  child: Text(
                                    lang.OK,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25.sp),
                                  ),
                                )
                              ],
                            ).show();
                          }
                        }
                      },
                      child: CustomButtonChild(
                          title: lang.ResetPassword,
                          fontSize: cubit.isEnglish()? 30 : 23,
                          width: 300.w,
                          height: 60)),
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
