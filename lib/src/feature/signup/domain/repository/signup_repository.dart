import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/feature/signup/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SignUpRepository {
  Future<Either<Failure, User>> signUp({required String email, required String password});
}