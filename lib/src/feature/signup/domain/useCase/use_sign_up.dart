import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/feature/signup/domain/repository/signup_repository.dart';
import 'package:amelia/src/shared/domain/useCase/useCase.dart';
import 'package:amelia/src/feature/signup/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';


class UseSignUp implements UseCase<User, UseSignUpParams>{
  SignUpRepository signUpRepository;
  UseSignUp(this.signUpRepository);

  @override
  Future<Either<Failure, User>> call(UseSignUpParams params) async {
    return await signUpRepository.signUp(email: params.email, password: params.password);
  }
}


class UseSignUpParams{
  final String email;
  final String password;

  UseSignUpParams({required this.email, required this.password});
}