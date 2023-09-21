import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginuser(UserModel user) {
    emit(LoginLoading());
    CollectionReference users =
        FirebaseFirestore.instance.collection(kCollectionUsers);
    users.add({
      'User name': user.username,
    }).then((value) {
      print("User Added : $value");
      emit(LoginSuccess());
    }).catchError((error) {
      print("Failed to add user: $error");
      emit(LoginFailure());
    });
  }
}
