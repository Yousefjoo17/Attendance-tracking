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
   bool newUser=true;

  Future<void> loginuser(UserModel userModel) async {
    emit(LoginLoading());

    try {
      QuerySnapshot querySnapshot = await usersReference.get();

      for (var user in querySnapshot.docs) {
        if (user[kName] == userModel.name) {
          newUser = false;
          if (user[kPassword] == userModel.password) {
            userModel.docID = user[kDocID];
            userModel.checkList = user[kCheckList];
            userModel.shouldCheckIn = user[kShouldCheckIn];
            emit(LoginSuccess());
            break;
          } else {
            emit(LoginFailure('Password is wrong'));
          }
        } else {
          newUser = true;
        }
      }
    } on Exception catch (e) {
      print('Error :$e');
      emit(LoginFailure(e.toString()));
    }

    if (newUser) {
      try {
        String docId = usersReference.doc().id;
        await usersReference.doc(docId).set({
          kName: userModel.name,
          kCheckList: [],
          kDocID: docId,
          kShouldCheckIn: true,
          kPassword: userModel.password
        });
        userModel.docID = docId;
        userModel.checkList = [];
        userModel.shouldCheckIn = true;
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }
  }
}
