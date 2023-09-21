import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginuser(UserModel userModel) async {
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
    } on Exception catch (e) {
      print('Error :$e');
      emit(LoginFailure());
    }

    for (var name in namesList) {
      if (name == userModel.name) {
        newUser = false;
        break;
      }
    }

    if (newUser) {
      try {
        String docId = users.doc().id;
        await users.doc(docId).set({
          kName: userModel.name,
          kCheckList: [],
          'id': docId,
        });
        userModel.docID = docId;
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure());
      }
    } else {
      emit(LoginSuccess());
    }
  }
}
