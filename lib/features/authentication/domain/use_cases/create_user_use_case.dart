import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/exceptions/server_failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class CreateUserUseCase {
  CreateUserUseCase({required this.userRepository});

  final UserRepository userRepository;

  Future<Either<bool, Failure>> call(UserEntity user) async {
    final userExists = await userRepository.findByEmail(user.email);

    return userExists.fold(
      (success) {
        return userRepository.createUser(user);
      },
      (failure) {
        return Right(ServerFailure());
      },
    );
  }
}
