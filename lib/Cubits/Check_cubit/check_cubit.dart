import 'package:attendence_tracking/Models/User_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckInitial());

  void checkIn(UserModel user){

  }
}
