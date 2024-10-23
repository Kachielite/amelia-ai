import 'package:amelia/src/feature/login/domain/entity/user.dart';
import 'package:amelia/src/feature/login/domain/useCase/use_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UseSignIn _useSignIn;

  LoginBloc({required UseSignIn useSignIn})
      : _useSignIn = useSignIn,
        super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      final res = await _useSignIn(
          UseSignInParam(email: event.email, password: event.password));
      return res.fold((failure) => left(emit(LoginFailure(failure.message))),
          (user) => right(emit(LoginSuccess(user))));
    });
  }
}
