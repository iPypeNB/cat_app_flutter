final class LoginDto {
  LoginDto.empty()
      : this(
          email: '',
          password: '',
        );

  const LoginDto({
    required this.email,
    required this.password,
  });

  LoginDto copyWith({
    String? email,
    String? password,
  }) =>
      LoginDto(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  final String email;
  final String password;
}
