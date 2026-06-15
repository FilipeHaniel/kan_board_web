class LoginEntity {
  final String accessToken;

  LoginEntity({
    required this.accessToken,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    return LoginEntity(
      accessToken: json['access_token'],
    );
  }
}
