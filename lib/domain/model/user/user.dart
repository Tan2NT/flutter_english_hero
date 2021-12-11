class User {
  final String email;
  final String userId;
  final String token;
  final DateTime? expiryDate;

  User(
      {required this.email,
      required this.userId,
      required this.token,
      required this.expiryDate});
}
