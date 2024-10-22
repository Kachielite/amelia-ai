import 'package:amelia/src/feature/signup/domain/useCase/use_sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UseSignUp _useSignUp;

  SignupBloc({required UseSignUp useSignUp})
      : _useSignUp = useSignUp,
        super(SignupInitial()) {
    on<Signup>((event, emit) async {
      emit(SignupLoading());
      final response = await _useSignUp(
          UseSignUpParams(email: event.email, password: event.password));

      response.fold((l) => left(emit(SignupFailure(l.message))),
          (r) => right(emit(SignupSuccess())));
    });
  }
}
