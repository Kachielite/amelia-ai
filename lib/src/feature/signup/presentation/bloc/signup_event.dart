part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class Signup extends SignupEvent {
  final String email;
  final String password;

  Signup(this.email, this.password);
}
