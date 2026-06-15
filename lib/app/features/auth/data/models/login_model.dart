import 'package:kan_board_web/app/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.accessToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'] as String,
    );
  }
}
