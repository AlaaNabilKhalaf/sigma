import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/constance.dart';
import 'package:sigma/cubit/layout_cubit/layout_cubit.dart';
import 'package:sigma/cubit/layout_cubit/layout_states.dart';
import 'package:sigma/views/home_view.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_button.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text_field.dart';

import '../../../generated/l10n.dart';
import '../sheared_widgets/custom_text.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return BlocConsumer<LayoutCubit , LayoutStates>(builder: (context , state ){
      final cubit = BlocProvider.of<LayoutCubit>(context);
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
                CustomText(text: lang.UniEmail, fontSize: 20 , textColor: blackColor,),
                CustomTextField(controller: cubit.uniEmailController,),
                CustomText(text: lang.LoginPassword, fontSize: 20 , textColor: blackColor,),
                CustomTextField(controller: cubit.loginPasswordController,),
                SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: GestureDetector(
                    onTap: () async {
                        if (cubit.loginPasswordController.text.isNotEmpty &&
                            cubit.uniEmailController.text.isNotEmpty)
                        {
                          try{
                            await cubit.login(
                                uniEmail: cubit.uniEmailController.text,
                                password: cubit.loginPasswordController.text);
                          }catch (e) {
                            cubit.loginMassage =lang.SomethingWentWrong;
                          }
                          if (cubit.loginMassage == "Logged in successfully")
                          {
                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Center(child: Text(cubit.loginMassage!)),
                            ));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeView()));
                          }
                          else {
                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(child: Text(cubit.loginMassage!)),
                            ));
                          }
                        }
                        else {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Center(
                                child: Text(
                                    lang.LoginValidationMassage)),
                          ));
                        }
                      },

                    child: CustomButtonChild(
                        title: lang.Login,
                        fontSize: 30,
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
    }, listener: (context , state){});
  }
}
