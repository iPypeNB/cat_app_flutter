import 'dart:async';

import 'package:cat_app_flutter/features/authentication/application/dtos/temp_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'temp_state.dart';
part 'temp_event.dart';


class TempBloc extends Bloc<TempEvent, TempState> {
  TempBloc() : super(const InitialState()) {
    _setUp();
  }

  void _setUp() {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
  }

  FutureOr<void> _onChangeEmailEvent(ChangeEmailEvent event, Emitter<TempState> emit) {
    final newData = state.data.copyWith(
      email: event.newEmail,
    );
    final newState = DataTempUpdated(
      data: newData
    );
    emit(newState);
  }

  FutureOr<void> _onChangePasswordEvent(ChangePasswordEvent event, Emitter<TempState> emit) {
    final newData = state.data.copyWith(
      password: event.newPassword,
    );
    final newState = DataTempUpdated(
      data: newData
    );
    emit(newState);
  }
}