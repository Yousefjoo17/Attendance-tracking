part of 'check_cubit.dart';

@immutable
sealed class CheckState {}

final class CheckInitial extends CheckState {}

final class CheckInSuccessPress extends CheckState {}

final class CheckInPressagian extends CheckState {
  final String message;
  CheckInPressagian(this.message);
}

final class CheckinFailurePress extends CheckState {
  final String errMessage;
  CheckinFailurePress(this.errMessage);
}

final class CheckoutSuccessPress extends CheckState {}

final class CheckOutPressagian extends CheckState {
  final String message;
  CheckOutPressagian(this.message);
}

final class CheckoutFailurePress extends CheckState {
  final String errMessage;
  CheckoutFailurePress(this.errMessage);
}

final class CheckListLoading extends CheckState {}

final class CheckListSuccess extends CheckState {}

final class CheckListFailure extends CheckState {
  final String errMessage;
  CheckListFailure(this.errMessage);
}
