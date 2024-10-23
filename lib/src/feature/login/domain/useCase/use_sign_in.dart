import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/feature/login/domain/entity/user.dart';
import 'package:amelia/src/feature/login/domain/repository/login_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/domain/useCase/useCase.dart';

class UseSignIn implements UseCase<User, UseSignInParam> {
  LoginRepository loginRepository;

  UseSignIn(this.loginRepository);

  @override
  Future<Either<Failure, User>> call(UseSignInParam params) async {
    return await loginRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UseSignInParam {
  final String email;
  final String password;

  UseSignInParam({required this.email, required this.password});
}
