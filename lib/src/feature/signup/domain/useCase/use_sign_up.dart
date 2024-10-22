import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/shared/domain/useCase/useCase.dart';
import 'package:amelia/src/feature/signup/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';


class UseSignUp implements UseCase<User, UseSignUpParams>{
  @override
  Future<Either<Failure, User>> call(UseSignUpParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}


class UseSignUpParams{
  final String email;
  final String password;

  UseSignUpParams({required this.email, required this.password});
}