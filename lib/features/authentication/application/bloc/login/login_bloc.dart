import 'dart:async';

import 'package:cat_app_flutter/features/authentication/application/dtos/dtos.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/base/password_value_object.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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
    on<AddAnalyticsContext>(_onAddContextAnalytics);
  }

  FutureOr<void> _onChangeEmailEvent(ChangeEmailEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(email: event.value);

    final newState = LoginDataUpdated(data: newData);
    emit(newState);
  }

  FutureOr<void> _onChangePasswordEvent(ChangePasswordEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(password: PasswordValueObject(event.value));

    final newState = LoginDataUpdated(data: newData);
    emit(newState);
  }

  FutureOr<void> _onAddContextAnalytics(AddAnalyticsContext event, Emitter<LoginState> emit) {
    debugPrint('Contexto: ${event.context}');
  }
}