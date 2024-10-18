import 'dart:async';

import 'package:cat_app_flutter/features/authentication/domain/use_cases/get_user_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc({
    required this.getUserUseCase,
  }) : super(const InitialState()) {
    on<LoginUserEvent>(_onLoginUserEvent);
    on<GetUserEvent>(_onGetUserEvent);
  }

  final GetUserUseCase getUserUseCase;


  FutureOr<void> _onLoginUserEvent(LoginUserEvent event,
      Emitter<WelcomeState> emit) {
    emit(const AuthenticationSuccessState(
        contentNotification: 'El usuario ha iniciado sesion'));
  }

  FutureOr<void> _onGetUserEvent(GetUserEvent event,
      Emitter<WelcomeState> emit) async {
    emit(const LoadingState());

    final resp = await getUserUseCase(event.email, event.phone);

    resp.fold(
          (user) =>
          emit(const AuthenticationSuccessState(
              contentNotification: 'Se ha leido el usuario exitosamente')),
          (failure) =>
          emit(const AuthenticationFailureState(
              contentNotification: 'Error al leer el usuario')),
    );
  }
}