abstract class ApiMethodsStates {}

class InitialApiState extends ApiMethodsStates{}
// Login Method States
class LoginLoadingState extends ApiMethodsStates{}
class LoginSuccessState extends ApiMethodsStates{}
class LoginFailureState extends ApiMethodsStates{}

// Reset Password Method States
class ResetPasswordLoadingState extends ApiMethodsStates{}
class ResetPasswordSuccessState extends ApiMethodsStates{}
class ResetPasswordFailureState extends ApiMethodsStates{}


//Languages
class LanguageChangedToArabic extends ApiMethodsStates{}
class LanguageChangedToEnglish extends ApiMethodsStates{}
class LanguageIsEnglish extends ApiMethodsStates{}


// Controllers
class CameraFlip extends ApiMethodsStates{}
class Flash extends ApiMethodsStates{}
class ControllerInitialed extends ApiMethodsStates{}


//QR Methods
class SendAttendanceLoadingState extends ApiMethodsStates{}
class SendAttendanceSuccessState extends ApiMethodsStates{}
class SendAttendanceFailureState extends ApiMethodsStates{}
class SendAttendanceFailureCatchState extends ApiMethodsStates{}
