import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigma/cubit/layout_cubit/layout_cubit.dart';
import 'package:sigma/cubit/layout_cubit/layout_states.dart';
import 'package:sigma/views/scanner_view.dart';
import '../../../generated/l10n.dart';
import '../../../sheared/constance/cache_data.dart';
import '../../../sheared/widgets/custom_button.dart';
import '../../../sheared/widgets/custom_upper_container.dart';
import '../../../sheared/widgets/some_custom_icons.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return BlocConsumer<LayoutCubit ,  LayoutStates>(builder: (context , state ){
      final cubit = BlocProvider.of<LayoutCubit>(context);
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15.h,),
                  Image.asset("assets/images/4137379-removebg-preview 1.png"),
                  SizedBox(height: 10.h,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            QrScanner(
                                userId: id !=null && id != "" ? id! : cubit.userId!

                            )));
                      },
                      child: CustomButtonChild(title: lang.QrScanner, fontSize:cubit.isEnglish() ? 30 : 28 , width: 250.w, height: 56)),
                ],
              ),
            ),
          )
        ],
      );
    },
        listener: (context , state ){});
  }
}
