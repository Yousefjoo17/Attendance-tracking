import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginuser(UserModel user) async {
    emit(LoginLoading());
    CollectionReference users =
        FirebaseFirestore.instance.collection(kCollectionUsers);
    List<String> namesList = [];
    bool newUser = true;

    try {
      QuerySnapshot querySnapshot = await users.get();
      namesList.clear();

      for (var user in querySnapshot.docs) {
        namesList.add(user[kName]);
      }
      print(namesList);
    } on Exception catch (e) {
      print('Error :$e');
      emit(LoginFailure());
    }
    for (var name in namesList) {
      if (name == user.name) {
        newUser = false;
        break;
      }
    }
    if (newUser) {
      print('new user');
      users.add({
        kName: user.name,
        kCheckList: [],
      }).then((value) {
        emit(LoginSuccess());
      }).catchError((error) {
        print("Failed to add user: $error");
        emit(LoginFailure());
      });
    } else {
      emit(LoginSuccess());
    }
  }
}
