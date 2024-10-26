import 'package:amelia/src/core/errors/server_exception.dart';
import 'package:amelia/src/shared/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class LoginDatasource {
  Session? get currentSession;

  Future<UserModel?> getCurrentUser();

  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password});
}

class LoginDatasourceImpl extends LoginDatasource {
  SupabaseClient supabaseClient;

  LoginDatasourceImpl(this.supabaseClient);

  @override
  Session? get currentSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(password: password, email: email);

      if (response.user == null) {
        throw ServerException("User is null");
      }

      return UserModel.fromJSON(response.user!.toJson());
    } on AuthException catch (error) {
      throw ServerException(error.message);
    } on ServerException catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      if (currentSession == null) {
        return null;
      } else {
        final user = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentSession!.user.id);
        return UserModel.fromJSON(user.first)
            .copyWith(email: currentSession!.user.email);
      }
    } on ServerException catch (error) {
      throw ServerException(error.toString());
    }
  }
}
