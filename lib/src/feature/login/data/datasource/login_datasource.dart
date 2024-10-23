import 'package:amelia/src/core/errors/server_exception.dart';
import 'package:amelia/src/feature/login/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class LoginDatasource {
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password});
}

class LoginDatasourceImpl extends LoginDatasource {
  SupabaseClient supabaseClient;

  LoginDatasourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(password: password, email: email);

      if (response.user == null) {
        throw ServerException("User is null");
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (error) {
      throw ServerException(error.message);
    } on ServerException catch (error) {
      throw ServerException(error.toString());
    }
  }
}
