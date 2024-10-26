import 'package:amelia/src/core/errors/failure.dart';
import 'package:amelia/src/feature/login/domain/useCase/use_current_user.dart';
import 'package:amelia/src/feature/login/domain/useCase/use_sign_in.dart';
import 'package:amelia/src/shared/domain/entities/user.dart';
import 'package:amelia/src/shared/domain/useCase/useCase.dart';
import 'package:amelia/src/shared/presentation/bloc/app_user_cubit/app_user_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UseSignIn _useSignIn;
  AppUserCubit _appUserCubit;
  UseCurrentUser _useCurrentUser;

  LoginBloc({
    required UseSignIn useSignIn,
    required AppUserCubit appUserCubit,
    required UseCurrentUser useCurrentUser,
  })  : _useSignIn = useSignIn,
        _appUserCubit = appUserCubit,
        _useCurrentUser = useCurrentUser,
        super(LoginInitial()) {
    on<Login>(_loginUser);
    on<LoginUserLoggedIn>(_loginUserLoggedIn);
  }

  _loginUser(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final res = await _useSignIn(
        UseSignInParam(email: event.email, password: event.password));
    return res.fold(
      (failure) => left(emit(LoginFailure(failure.message))),
      (user) => right(_getUser(user, emit)),
    );
  }

  _loginUserLoggedIn(LoginUserLoggedIn event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final res = await _useCurrentUser(NoParams());
    return res.fold(
      (l) => Failure(l.message),
      (user) => _getUser(user, emit),
    );
  }

  _getUser(User user, Emitter<LoginState> emit) {
    _appUserCubit.updateUser(user);
    emit(LoginSuccess(user));
  }
}
