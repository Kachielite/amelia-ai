import 'package:amelia/src/feature/login/data/datasource/login_datasource.dart';
import 'package:amelia/src/feature/login/data/repository/login_repository_impl.dart';
import 'package:amelia/src/feature/login/domain/repository/login_repository.dart';
import 'package:amelia/src/feature/login/domain/useCase/use_sign_in.dart';
import 'package:amelia/src/feature/login/presentation/bloc/login_bloc.dart';
import 'package:amelia/src/feature/signup/data/datasource/signup_datasource.dart';
import 'package:amelia/src/feature/signup/data/repository/signup_repository_impl.dart';
import 'package:amelia/src/feature/signup/domain/repository/signup_repository.dart';
import 'package:amelia/src/feature/signup/domain/useCase/use_sign_up.dart';
import 'package:amelia/src/feature/signup/presentation/bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/secrets/app_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseURL, anonKey: AppSecrets.anonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);
  _initSignUp();
  _initLogin();
}

void _initSignUp() {
  serviceLocator.registerFactory<SignUpDatasource>(
      () => SignUpDatasourceImpl(serviceLocator()));
  serviceLocator.registerFactory<SignUpRepository>(
      () => SignUpRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<UseSignUp>(() => UseSignUp(serviceLocator()));
  serviceLocator.registerLazySingleton<SignupBloc>(
      () => SignupBloc(useSignUp: serviceLocator()));
}

void _initLogin() {
  serviceLocator.registerLazySingleton<LoginDatasource>(
      () => LoginDatasourceImpl(serviceLocator()));
  serviceLocator.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory<UseSignIn>(() => UseSignIn(serviceLocator()));
  serviceLocator.registerLazySingleton<LoginBloc>(
      () => LoginBloc(useSignIn: serviceLocator()));
}
