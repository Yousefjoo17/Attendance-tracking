import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckInitial());

  Future<void> checkIn(UserModel userModel) async {
    if (!userModel.shouldCheckIn!) {
      emit(CheckInPressagian('You have already checked in before'));
      return;
    }

    try {
      userModel.checkList!.add(DateTime.now());
      await FirebaseFirestore.instance
          .collection(kCollectionUsers)
          .doc(userModel.docID)
          .update({
        kCheckList: userModel.checkList,
        kShouldCheckIn: false,
      });
      userModel.shouldCheckIn = false;
      emit(CheckInSuccessPress());
    } catch (e) {
      print(e);
      emit(CheckinFailurePress(e.toString()));
    }
  }

  Future<void> checkOut(UserModel userModel) async {
    if (userModel.shouldCheckIn!) {
      emit(CheckOutPressagian('You have already checked out before'));
      return;
    }
    try {
      userModel.checkList!.add(DateTime.now());
      await FirebaseFirestore.instance
          .collection(kCollectionUsers)
          .doc(userModel.docID)
          .update({
        kCheckList: userModel.checkList,
        kShouldCheckIn: true,
      });
      userModel.shouldCheckIn = true;
      emit(CheckoutSuccessPress());
    } catch (e) {
      emit(CheckinFailurePress(e.toString()));
    }
  }
}

/*

 */