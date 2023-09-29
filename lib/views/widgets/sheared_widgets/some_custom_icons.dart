import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigma/cubit/layout_cubit/layout_cubit.dart';
import 'package:sigma/cubit/layout_cubit/layout_states.dart';
import 'package:sigma/views/login_view.dart';
import 'package:sigma/views/widgets/sheared_widgets/custom_text.dart';
import '../../../constance/colors.dart';
import '../../../generated/l10n.dart';
import '../../reset_password_view.dart';

class LanguageIcon extends StatelessWidget {
  const LanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit , LayoutStates>(
      builder: (context , state){
        final cubit = BlocProvider.of<LayoutCubit>(context);
        return  IconButton(
          icon: const Icon(Icons.language , color: whiteColor, size: 30,),
          onPressed: (){
            cubit.changeLocale();
          },);
      },
      listener: (context , state ){},
    );
  }
}
enum _OptionsForResetPass {
  one
}

class NavigatorIconForResetPassView extends StatelessWidget {
  const NavigatorIconForResetPassView ({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return
  BlocConsumer<LayoutCubit , LayoutStates>(builder: (context , state ){
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return
      PopupMenuButton<_OptionsForResetPass>(itemBuilder: (context )=> [
      PopupMenuItem(
        value: _OptionsForResetPass.one,
        child: CustomText(text: lang.LogOut, fontSize: cubit.isEnglish() ? 15 : 12, textColor: blackColor,),),
    ],
      icon: const Icon(
        Icons.more_vert_outlined,
        color: Colors.white,
      ),
      iconSize: 30,
      onSelected: (value){
        if(value == _OptionsForResetPass.one){
        cubit.cleanCacheID();
         cubit.logoutFunction();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginView()));
        }
      },
      splashRadius: 69,
      position: PopupMenuPosition.under,);
  }, listener: (context , state ){});
  }
}

enum _Options {
  one , two
}

class NavigatorIcon extends StatelessWidget {
  const NavigatorIcon({super.key});

  @override
  Widget build(BuildContext context) {

    final lang = S.of(context);
    return
    BlocConsumer<LayoutCubit , LayoutStates>(builder: (context , state )
    {
      final cubit = BlocProvider.of<LayoutCubit>(context);

      return PopupMenuButton<_Options>(itemBuilder: (context )=> [
        PopupMenuItem(
          value: _Options.one,
          child: Container(
              decoration:
              BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomText(text: lang.ResetPassword, fontSize: cubit.isEnglish() ? 15 : 12, textColor: blackColor,)),),
        PopupMenuItem(
          value:  _Options.two,
          child: CustomText(text: lang.LogOut,fontSize:  cubit.isEnglish() ? 15 : 12, textColor: blackColor,),) ,
      ],
        elevation: 30,
        icon: const Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
        iconSize: 30,
        onSelected: (value){
          if(value == _Options.one){
            cubit.cleanControllersFunctions();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const ResetPasswordView()));
          }
          else{
            cubit.cleanCacheID();
            cubit.logoutFunction();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginView()));
          }
        },
        position: PopupMenuPosition.under,
      );
    },
        listener: (context , state ){});

  }
}
