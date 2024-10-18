class UserEntity {
  const UserEntity({
    required this.email,
    required this.birthdate,
    required this.phone,
    this.name,
  });

  final String email;
  final String? name;
  final DateTime birthdate;
  final String phone;
}
