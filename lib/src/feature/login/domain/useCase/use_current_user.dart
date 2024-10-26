import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/feature/login/domain/repository/login_repository.dart';
import 'package:amelia/src/shared/domain/entities/user.dart';
import 'package:amelia/src/shared/domain/useCase/useCase.dart';
import 'package:fpdart/src/either.dart';

class UseCurrentUser implements UseCase<User, NoParams> {
  LoginRepository loginRepository;

  UseCurrentUser(this.loginRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await loginRepository.getCurrentUser();
  }
}
