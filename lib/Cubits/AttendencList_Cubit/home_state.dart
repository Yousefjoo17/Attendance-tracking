part of 'home_cubit.dart';

@immutable
sealed class AddtendanceListState {}

final class AddtendanceListInitial extends AddtendanceListState {}

final class AddtendanceListLoading extends AddtendanceListState {}

final class AddtendanceListSuccess extends AddtendanceListState {}

final class AddtendanceListFailure extends AddtendanceListState {}
