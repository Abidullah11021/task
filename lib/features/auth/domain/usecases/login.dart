import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:task/features/auth/domain/repository/auth_repository.dart';
import 'package:task/infrastructure/usecase.dart';
import 'package:task/infrastructure/usecase_input.dart';
import 'package:task/infrastructure/usecase_output.dart';

class LoginUsecaseInput extends Input {
  final String email;
  final String password;
  LoginUsecaseInput({required this.email, required this.password});
}

class LoginUsecaseOutput extends Output {
  final UserCredential userCredential;
  LoginUsecaseOutput({
    required this.userCredential,
  });
}

@lazySingleton
class LoginUsecase extends Usecase<LoginUsecaseInput, LoginUsecaseOutput> {
  final AuthRepository _authRepository;

  LoginUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LoginUsecaseOutput> call(LoginUsecaseInput input) async {
    return await _authRepository.login(input);
  }
}
