
part of 'login_bloc.dart';

sealed class LoginEvent {
 const LoginEvent();
}

final class ChangePasswordEvent extends LoginEvent {
  final String value;

  const ChangePasswordEvent({required this.value});
}

final class ChangeEmailEvent extends LoginEvent {
  final String value;

  const ChangeEmailEvent({required this.value});
}