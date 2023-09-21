import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  CollectionReference usersReference =
      FirebaseFirestore.instance.collection(kCollectionUsers);
  bool newUser = true;

  Future<void> loginuser(UserModel userModel) async {
    emit(LoginLoading());

    try {
      QuerySnapshot querySnapshot = await usersReference.get();

      for (var user in querySnapshot.docs) {
        if (user[kName] == userModel.name) {
          newUser = false;
          userModel.docID = user[kDocID];
          userModel.checkList = user[kCheckList];
          break;
        }
      }
    } on Exception catch (e) {
      print('Error :$e');
      emit(LoginFailure());
    }

    if (newUser) {
      try {
        String docId = usersReference.doc().id;
        await usersReference.doc(docId).set({
          kName: userModel.name,
          kCheckList: [],
          kDocID: docId,
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
