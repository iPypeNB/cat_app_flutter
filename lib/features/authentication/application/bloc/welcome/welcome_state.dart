part of 'welcome_bloc.dart';

sealed class WelcomeState extends Equatable {

  const WelcomeState();

  @override
  List<Object?> get props => [];
}

final class InitialState extends WelcomeState {
  const InitialState();
}

final class AuthenticationSuccessState extends WelcomeState {
  const AuthenticationSuccessState({required this.contentNotification});

  final String contentNotification;
}

final class AuthenticationFailureState extends WelcomeState {
  const AuthenticationFailureState({required this.contentNotification});

  final String contentNotification;
}

final class LoadingState extends WelcomeState {
  const LoadingState();
}