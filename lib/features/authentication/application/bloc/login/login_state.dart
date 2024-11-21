part of 'login_bloc.dart';

sealed class LoginState extends Equatable {

}

final class InitialState extends LoginState {

  @override
  List<Object?> get props => throw UnimplementedError();
}