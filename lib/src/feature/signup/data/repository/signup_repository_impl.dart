import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/core/errors/server_exception.dart';
import 'package:amelia/src/feature/signup/data/datasource/signup_datasource.dart';
import 'package:amelia/src/feature/signup/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/repository/signup_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  SignUpDatasource signUpDatasource;

  SignUpRepositoryImpl(this.signUpDatasource);

  @override
  Future<Either<Failure, User>> signUp(
      {required String email, required String password}) async {
    try {
      final user =
          await signUpDatasource.signUp(email: email, password: password);
      return right(user);
    } on ServerException catch (error) {
      return left(Failure(error.toString()));
    }
  }
}
