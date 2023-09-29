import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/cubit/layout_cubit/layout_cubit.dart';
import 'package:sigma/cubit/layout_cubit/layout_states.dart';
import 'package:sigma/views/home_view.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_button.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text_field.dart';
import '../../../constance/colors.dart';
import '../../../generated/l10n.dart';
import '../sheared_widgets/custom_text.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit , LayoutStates>(builder: (context , state ){
      return Container(
        height: MediaQuery.of(context).size.height*0.4,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 48),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h,),
                CustomText(text: lang.UniEmail, fontSize: cubit.isEnglish()? 20 : 19,textColor: blackColor,),
                CustomTextField(controller: cubit.uniEmailController,),
                CustomText(text: lang.LoginPassword, fontSize:cubit.isEnglish()? 20 : 19, textColor: blackColor,),
                CustomTextField(controller: cubit.loginPasswordController,),
                SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: GestureDetector(
                    onTap: () async {
                        if (cubit.loginPasswordController.text.isNotEmpty &&
                            cubit.uniEmailController.text.isNotEmpty)
                        {
                            await cubit.login(
                                uniEmail: cubit.uniEmailController.text,
                                password: cubit.loginPasswordController.text);
                        }
                        else {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: primeColor1,
                            content: Center(
                                child: Text(
                                    lang.LoginValidationMassage)),
                          ));
                        }
                      },

                    child: CustomButtonChild(
                        title: state is LoginLoadingState ? lang.Loading : lang.Login,
                        fontSize: cubit.isEnglish()? 30 : 23,
                        width: 180,
                        height: 60,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }, listener: (context , state){
      if(state is LoginSuccessState){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: primeColor1,
          duration: const Duration(seconds: 1),
          content: Center(child: Text(cubit.loginMassage!)),
        ));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeView()));
      }
      if(state is LoginFailureState){
        Navigator.pop(context);
        showDialog(context: context, builder: (context)=> AlertDialog(
          content: Text(state.massage),
        ));
      }
      if(state is LoginLoadingState){
        showDialog(context: context, builder: (context)=> AlertDialog(
          content: Text(lang.Loading),
        ));
      }
      if(state is LoginCatchFailureState){
        Navigator.pop(context);
        showDialog(context: context, builder: (context)=> AlertDialog(
          content: Text(lang.SomethingWentWrong),
        ));
      }
    });
  }
}
