import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class RegisterUsecaseInput extends Input {
  final String email;
  final String password;
  RegisterUsecaseInput({
    required this.email,
    required this.password,
  });
}

class RegisterUsecaseOutput extends Output {
  final UserCredential userCredential;
  RegisterUsecaseOutput({
    required this.userCredential,
  });
}

@lazySingleton
class RegisterUsecase
    extends Usecase<RegisterUsecaseInput, RegisterUsecaseOutput> {
  final AuthRepository _authRepository;

  RegisterUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<RegisterUsecaseOutput> call(RegisterUsecaseInput input) async {
    return await _authRepository.register(input);
  }
}
