import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class GoogleLoginUsecaseInput extends Input {
  GoogleLoginUsecaseInput();
}

class GoogleLoginUsecaseOutput extends Output {
  final UserCredential? userCredential;
  GoogleLoginUsecaseOutput({
    required this.userCredential,
  });
}

@lazySingleton
class GoogleLoginUsecase
    extends Usecase<GoogleLoginUsecaseInput, GoogleLoginUsecaseOutput> {
  final AuthRepository _authRepository;

  GoogleLoginUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<GoogleLoginUsecaseOutput> call(GoogleLoginUsecaseInput input) async {
    return await _authRepository.googleLogin(input);
  }
}
