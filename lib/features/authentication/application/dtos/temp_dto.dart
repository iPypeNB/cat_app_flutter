final class TempDto {
  const TempDto({
    required this.email,
    required this.password,
  });

  const TempDto.empty() : this(
    email: '',
    password:  ''
  );

  final String email;
  final String password;

  TempDto copyWith({
    String? email,
    String? password,
  }) =>
      TempDto(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
