class UserEntity {
  final String email;
  final String userId;
  final String token;
  final DateTime? expiryDate;

  UserEntity(
      {required this.email,
      required this.userId,
      required this.token,
      required this.expiryDate});

  factory UserEntity.fromJson(Map<String, dynamic> userData) {
    return UserEntity(
        email: userData['email'],
        userId: 'localId',
        token: 'idToken',
        expiryDate: DateTime.now()
            .add(Duration(seconds: int.parse(userData['expiresIn']))));
  }
}
