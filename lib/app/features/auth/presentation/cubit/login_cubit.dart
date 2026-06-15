import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _useCase;

  LoginCubit({required LoginUsecase useCase})
    : _useCase = useCase,
      super(LoginInitial());

  Future<void> login(
    String email,
    String password,
  ) async {
    emit(LoginLoading());

    final result = await _useCase(
      email: email,
      password: password,
    );

    switch (result) {
      case Success():
        emit(LoginSuccess());

      case FailureResult():
        emit(
          LoginError(result.failure.message),
        );
    }
  }
}
