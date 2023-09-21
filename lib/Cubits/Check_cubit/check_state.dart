part of 'check_cubit.dart';

@immutable
sealed class CheckState {}

final class CheckInitial extends CheckState {}

final class CheckSuccessPress extends CheckState {}

final class CheckFailurePress extends CheckState {
  final String errMessage;
  CheckFailurePress(this.errMessage);
}

final class CheckListLoading extends CheckState {}

final class CheckListSuccess extends CheckState {}

final class CheckListFailure extends CheckState {
  final String errMessage;
  CheckListFailure(this.errMessage);
}
