import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../local_network/local_network.dart';
import 'layout_states.dart';
import 'package:http/http.dart%20';
import 'package:http/http.dart ' as http;
import 'package:intl/intl.dart';

// This cubit provides Screens UI, ABI Methods and returned date

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  //Change Password Screen UI Items
  bool oldPassCheck = true;
  bool newPassCheck = true;
  bool conPassCheck = true;

  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final newPassConController = TextEditingController();

  changeOldPassCheckVisibility() {
    oldPassCheck = !oldPassCheck;
    emit(OldPasswordVisibilityChanged());
  }

  changeNewPassCheckVisibility() {
    newPassCheck = !newPassCheck;
    emit(NewPasswordVisibilityChanged());
  }

  changeConPassCheckVisibility() {
    conPassCheck = !conPassCheck;
    emit(NewPasswordConVisibilityChanged());
  }

  //Login Screen UI Items
  bool loginPassCheck = true;
  final uniEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  changeLoginPassVisibility() {
    loginPassCheck = !loginPassCheck;
    emit(LoginPasswordVisibilityChanged());
  }

  //ApI Methods

// Login Method Items
  int? userId;
  String? loginMassage;
  String? theKey;
  String? oldPassword;

  Future<void> login({
    required String uniEmail,
    required String password,
  })

  async {
    emit(LoginLoadingState());
   try{
     Response response = await http.post(
         Uri.parse(
             'https://sigma.ebdaa-business.com/api/mobile_api/student_login'),
         body: {
           'university_email': uniEmail,
           'password': password
         },
         headers: {
           'accept': 'application/json',
           'User': 'admin',
           'apikey': 'apikey',
           'Content-Type': 'application/x-www-form-urlencoded'
         });
     Map<String, dynamic> data = jsonDecode(response.body);
     if (response.statusCode == 200) {
       loginMassage = data["message"];
       userId = data["student_id"];

       await CacheNetwork.insertToValueID(
         key: 'student_id',
         value: data['student_id'],
       );
       theKey = 'student_id';
       emit(LoginSuccessState(

       ));
     } else {
       emit(LoginFailureState(
           massage: "${data["message"]}"
       ));
     }
   }catch(e){
     emit(LoginCatchFailureState());
   }
  }

// Reset Password Method Items
  String? passMassage;

  Future<void> resetPassword(
      {required String oldPassword, required String newPassword}) async {
    emit(ResetPasswordLoadingState());
try{

  Response response = await http.post(
      Uri.parse(
          'https://sigma.ebdaa-business.com/api/mobile_api/change_password?student_id=$userId'),
      body: {
        'old_password': oldPassword,
        'new_password': newPassword,
      },
      headers: {
        'accept': 'application/json',
        'User': 'admin',
        'apikey': 'apikey',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
  Map<String, dynamic> data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    passMassage = data["message"];
    emit(ResetPasswordSuccessState());
  } else {
    emit(ResetPasswordFailureState(
        massage: data["message"]
    ));
  }
}catch(e){
  emit(ResetPasswordCatchFailureState());
}
  }


// Localizations Items
  String theLangKey = 'current_lang' ;
  Locale currentLang = const Locale("en") ;

  bool isEnglish() {
    return Intl.getCurrentLocale() == 'en';
  }

  changeLocale() async {
    emit(LanguageChangingLoading());
    if(currentLang == const Locale('ar')){
      currentLang = const Locale('en');
      await CacheNetwork.deleteCacheItem(key: 'current_lang');
      await CacheNetwork.insertToValueLange(
        key: 'current_lang',
        value: 'en',
      );
      emit(LanguageChangedToEnglish());
    } else if(currentLang == const Locale("en")){
      currentLang = const Locale('ar');
      await CacheNetwork.deleteCacheItem(key: 'current_lang');
      await CacheNetwork.insertToValueLange(
        key: 'current_lang',
        value: 'ar',
      );
      emit(LanguageChangedToArabic());
    }

  }

  // Logout Methods

  cleanCacheID  ()
  async{
    await  CacheNetwork.deleteCacheItem(key: "student_id");
  emit(CleanCacheID());
  }

  logoutFunction() async {
    loginPasswordController.text = "";
    uniEmailController.text = "" ;
    // SharedPreferences sharedPref = await SharedPreferences.getInstance();
    // sharedPref.remove('student_id');
    emit(UserIsLoggingOutState());
  }

  cleanControllersFunctions(){
    loginPasswordController.text = "";
    uniEmailController.text = "" ;
    oldPassController.text = "";
    newPassController.text = "";
    newPassConController.text = "";
    emit(ControllersAreCleanState());
  }
}










