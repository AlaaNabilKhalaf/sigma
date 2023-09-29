import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/cubit/layout_cubit/layout_cubit.dart';
import 'package:sigma/cubit/layout_cubit/layout_states.dart';
import 'package:sigma/views/done_view.dart';
import '../../../generated/l10n.dart';
import '../../../sheared/constance/colors.dart';
import '../../../sheared/widgets/custom_button.dart';
import '../../../sheared/widgets/custom_text.dart';
import '../../../sheared/widgets/custom_text_field.dart';
import '../../../sheared/widgets/custom_upper_container.dart';
import '../../../sheared/widgets/some_custom_icons.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    final lang = S.of(context);
    return BlocConsumer<LayoutCubit , LayoutStates>(builder: (context , state ){
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
                            backgroundColor: primeColor1,
                            duration: const Duration(seconds: 1),
                            content:
                            Center(child: Text(lang.AllFieldsRequired)),
                          ));
                        } else if (cubit.newPassController.text !=
                            cubit.newPassConController.text) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context)
                              .showSnackBar( SnackBar(
                            backgroundColor: primeColor1,
                            duration: const Duration(seconds: 1),
                            content: Center(
                                child: Text(lang.NewPasswordsDoNotMatch)),
                          ));
                        } else if (cubit.newPassController.text ==
                            cubit.newPassConController.text &&
                            cubit.oldPassController.text.isNotEmpty) {

                            await cubit.resetPassword(
                                oldPassword: cubit.oldPassController.text,
                                newPassword: cubit.newPassController.text);

                        }
                      },
                      child: CustomButtonChild(
                          title: state is ResetPasswordLoadingState ? lang.Loading : lang.ResetPassword,
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
        listener: (context , state){
      if(state is ResetPasswordSuccessState){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const DoneView()));
      }
      if(state is ResetPasswordLoadingState){
        showDialog(context: context, builder: (context)=> AlertDialog(
          backgroundColor: primeColor2,
          titleTextStyle:  const TextStyle(color: Colors.white , fontFamily: "Cairo" ,),
          title: Text(lang.Loading),
        ));
      }
      if(state is ResetPasswordFailureState){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        showDialog(context: context, builder: (context)=>
            AlertDialog(
          backgroundColor: primeColor2,
          titleTextStyle:  const TextStyle(color: Colors.white , fontFamily: "Cairo" ,),
         title: Text(state.massage),
        ));

      }
      if(state is ResetPasswordCatchFailureState){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        showDialog(context: context, builder: (context)=> AlertDialog(
          backgroundColor: primeColor2,
          titleTextStyle:  const TextStyle(color: Colors.white , fontFamily: "Cairo" ,),
          title: Text(lang.SomethingWentWrong),
        ));
      }
        });
  }
}
