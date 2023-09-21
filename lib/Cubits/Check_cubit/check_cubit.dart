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

  Future<void> checkIn(UserModel userModel) async {
    print(userModel.docID);
    try {
      await FirebaseFirestore.instance
          .collection(kCollectionUsers)
          .doc(userModel.docID)
          .update({
        kCheckList: [1, 2, 3],
      });
    } catch (e) {
      emit(CheckinFailurePress(e.toString()));
    }
    emit(CheckinSuccessPress());
  }
}

/*

 */