import 'package:easy_bus_app/models/login/user_login.dart';

abstract class UserLoginStates{}
class UserLoginInitState extends UserLoginStates{}
class UserLoginLoadingState extends UserLoginStates{}
class UserLoginSuccessState extends UserLoginStates{
  final UserLoginModel loginModel;

  UserLoginSuccessState(this.loginModel);
}
class UserLoginErrorState extends UserLoginStates{
  final String error;

  UserLoginErrorState(this.error);
}


