//import 'package:weather_app_new/features/current/current_model.dart';
//import 'package:meta/meta.dart';
//import 'package:weather_app_new/current_cubit.dart';

part of 'current_cubit.dart';

@immutable
sealed class CurrentState {}

class CurrentInitial extends CurrentState {}

class CurrentLoading extends CurrentState {}

class CurrentLoaded extends CurrentState {
  CurrentLoaded({required this.response});

  final List<CurrentModel?> response;
}

class CurrentError extends CurrentState {
  CurrentError({required this.error});

  final String error;
}
