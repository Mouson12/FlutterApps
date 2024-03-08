import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app_new/current_model.dart';
import 'package:weather_app_new/features/current/current_weather.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';

part 'current_state.dart';

class CurrentCubit extends Cubit<CurrentState> {
  CurrentCubit({required CurrentRepository currentRepository})
      : _currentRepository = currentRepository,
        super(CurrentInitial());

  final CurrentRepository _currentRepository;

  Future<void> getCurrent(place) async {
    try {
      emit(CurrentLoading());
      final hasConnected = await InternetConnectionChecker().hasConnection;
      if (hasConnected) {
        final serverResponse = await _currentRepository.getCurrent(place);
        await _currentRepository.saveCurrentLocally(posts: serverResponse);
        final localPosts = await _currentRepository.fetchAllLocalCurrents();
        emit(CurrentLoaded(response: localPosts));
      } else {
        final localPosts = await _currentRepository.fetchAllLocalCurrents();
        emit(CurrentLoaded(response: localPosts));
      }
    } catch (e) {
      emit(CurrentError(error: e.toString()));
    }
  }
}
