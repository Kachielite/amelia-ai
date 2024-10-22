import 'package:amelia/src/core/errors/server_exception.dart';
import 'package:amelia/src/feature/signup/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class SignUpDatasource{
  Future<UserModel> signUp({required String email, required String password});
}

class SignUpDatasourceImpl implements SignUpDatasource{

  SupabaseClient supabaseClient;
  SignUpDatasourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signUp({required String email, required String password}) async {
    try{
      final response = await supabaseClient.auth.signUp(password: password, email: email);

      if(response.user == null){
        throw ServerException('User is null');
      }

      return UserModel.fromJSON(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch(error){
      throw ServerException(error.toString());
    }
  }

}