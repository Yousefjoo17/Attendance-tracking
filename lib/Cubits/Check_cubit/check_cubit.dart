import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckInitial());
  CollectionReference users =
      FirebaseFirestore.instance.collection(kCollectionUsers);
  

  void checkIn(UserModel user) {}

}

/*
Future<void> getuser(UserModel userModel) async {
    try {
      QuerySnapshot querySnapshot = await users.get();

      for (var user in querySnapshot.docs) {
        if (userModel.name == user[kName]) {
          userModel.docID = user[kDocID];
          break;
        }
      }
    } on Exception catch (e) {
      print('Error :$e');
    }
  }
 */