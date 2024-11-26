part of 'temp_bloc.dart';

final class TempEvent {
  const TempEvent();
}

final class ChangeEmailEvent extends TempEvent {
  const ChangeEmailEvent({required this.newEmail});

  final String newEmail;
}

final class ChangePasswordEvent extends TempEvent {
  const ChangePasswordEvent({required this.newPassword});

  final String newPassword;
}