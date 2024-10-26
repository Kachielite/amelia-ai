import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/core/errors/server_exception.dart';
import 'package:amelia/src/feature/login/data/datasource/login_datasource.dart';
import 'package:amelia/src/feature/login/domain/repository/login_repository.dart';
import 'package:amelia/src/shared/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDatasource loginDatasource;

  LoginRepositoryImpl(this.loginDatasource);

  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final user = await loginDatasource.signInWithEmailPassword(
          email: email, password: password);
      return right(user);
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await loginDatasource.getCurrentUser();

      if (user == null) {
        return left(Failure('User is not logged in'));
      }

      return right(user);
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }
}
