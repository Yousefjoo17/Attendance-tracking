import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class AttendanceListCubit extends Cubit<AddtendanceListState> {
  AttendanceListCubit() : super(AddtendanceListInitial());
  CollectionReference users =
      FirebaseFirestore.instance.collection(kCollectionUsers);
  List<String> list = [];
  Future<void> getList({required UserModel user}) async {
    try {
      QuerySnapshot querySnapshot = await users.get();

      for (var user in querySnapshot.docs) {
        list.add(user[kName]);
      }
      print(list);
    } on Exception catch (e) {
      print('Error :$e');
    }
  }
}
