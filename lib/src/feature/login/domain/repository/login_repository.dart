import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/feature/login/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class LoginRepository {
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password});
}
