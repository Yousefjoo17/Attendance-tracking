import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckInitial());

  List checkList = [];
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection(kCollectionUsers);

  Future<void> checkIn(UserModel userModel) async {
    if (!userModel.shouldCheckIn!) {
      emit(CheckInPressagian('You have already checked in before'));
      return;
    }

    try {
      final DateTime dateTime = DateTime.now();
      final formattedtime = DateFormat('dd/MM/yyyy  HH:mm').format(dateTime);
      userModel.checkList!.add(formattedtime);
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
      final DateTime dateTime = DateTime.now();
      final formattedtime = DateFormat('dd/MM/yyyy  HH:mm').format(dateTime);
      userModel.checkList!.add(formattedtime);
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
