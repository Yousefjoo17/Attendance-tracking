part of 'check_cubit.dart';

@immutable
sealed class CheckState {}

final class CheckInitial extends CheckState {}

final class CheckinSuccessPress extends CheckState {}

final class CheckinFailurePress extends CheckState {
  final String errMessage;
  CheckinFailurePress(this.errMessage);
}

final class CheckoutSuccessPress extends CheckState {}

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
