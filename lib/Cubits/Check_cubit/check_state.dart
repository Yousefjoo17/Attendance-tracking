part of 'check_cubit.dart';

@immutable
sealed class CheckState {}

final class CheckInitial extends CheckState {}

final class CheckLoading extends CheckState {}

final class CheckSuccess extends CheckState {}

final class CheckFailure extends CheckState {
  final String errMessage;
  CheckFailure(this.errMessage);
}

final class CheckSuccessPress extends CheckState {}

final class CheckFailurePress extends CheckState {
  final String errMessage;
  CheckFailurePress(this.errMessage);
}
