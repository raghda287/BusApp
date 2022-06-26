import 'package:easy_bus_app/models/login/user_login.dart';
import 'package:easy_bus_app/modules/auth/widgets/login/states.dart';
import 'package:easy_bus_app/shared/network/end_points.dart';
import 'package:easy_bus_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLoginCubit extends Cubit <UserLoginStates>{
  UserLoginCubit():super(UserLoginInitState());
  static UserLoginCubit get( context) => BlocProvider.of(context);
  UserLoginModel? loginModel ;

  void userLogin({
  required String email,
    required String password,
})
  {
    emit(UserLoginLoadingState());
    DioHelper.postData(url: LOGIN,data:{
    'email':email,
    'password':password,
    },
    ).then((value) {
      print(value.data['message']);
      loginModel=UserLoginModel.fromjson(value.data);
      print(loginModel!.data);
      print(loginModel!.message);

      emit(UserLoginSuccessState(loginModel!));
    }).catchError((error){
      emit(UserLoginErrorState(error.toString()));
    });
  }
}
