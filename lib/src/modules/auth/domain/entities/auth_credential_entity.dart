class AuthCredentialEntity {
  const AuthCredentialEntity({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;
}
