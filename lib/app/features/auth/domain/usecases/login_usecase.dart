abstract class LoginUsecase {
  Future<String> call({
    required String email,
    required String password,
  });
}
