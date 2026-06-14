class AuthUser {
  final String accessToken;

  AuthUser({
    required this.accessToken,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      accessToken: json['access_token'],
    );
  }
}
