part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState({required this.data});

  final LoginDto data;
}

final class InitialState extends LoginState {

  InitialState() : super(
    data: LoginDto.empty(),
  );

  @override
  List<Object?> get props => [super.data];
}

final class LoginDataUpdated extends LoginState {

  const LoginDataUpdated({required super.data});

  @override
  List<Object?> get props => [super.data];

}