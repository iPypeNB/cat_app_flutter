import 'dart:async';

import 'package:cat_app_flutter/features/authentication/application/dtos/dtos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()){
    _setUp();
  }

  void _setUp() {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
  }

  FutureOr<void> _onChangeEmailEvent(ChangeEmailEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(email: event.value);

    final newState = LoginDataUpdated(data: newData);
    emit(newState);
  }

  FutureOr<void> _onChangePasswordEvent(ChangePasswordEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(password: event.value);

    final newState = LoginDataUpdated(data: newData);
    emit(newState);
  }
}