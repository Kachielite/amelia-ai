import 'package:amelia/src/feature/login/data/datasource/login_datasource.dart';
import 'package:amelia/src/feature/login/data/repository/login_repository_impl.dart';
import 'package:amelia/src/feature/login/domain/repository/login_repository.dart';
import 'package:amelia/src/feature/login/domain/useCase/use_current_user.dart';
import 'package:amelia/src/feature/login/domain/useCase/use_sign_in.dart';
import 'package:amelia/src/feature/login/presentation/bloc/login_bloc.dart';
import 'package:amelia/src/feature/signup/data/datasource/signup_datasource.dart';
import 'package:amelia/src/feature/signup/data/repository/signup_repository_impl.dart';
import 'package:amelia/src/feature/signup/domain/repository/signup_repository.dart';
import 'package:amelia/src/feature/signup/domain/useCase/use_sign_up.dart';
import 'package:amelia/src/feature/signup/presentation/bloc/signup_bloc.dart';
import 'package:amelia/src/shared/presentation/bloc/app_user_cubit/app_user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/secrets/app_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize Supabase
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseURL,
    anonKey: AppSecrets.anonKey,
  );

  // Register core services and clients
  serviceLocator.registerLazySingleton(
    () => supabase.client,
  );
  serviceLocator.registerLazySingleton<AppUserCubit>(
    () => AppUserCubit(),
  );

  // Initialize SignUp dependencies
  _initSignUp();
  // Initialize Login dependencies
  _initLogin();
}

void _initSignUp() {
  // Register Data Sources
  serviceLocator.registerFactory<SignUpDatasource>(
    () => SignUpDatasourceImpl(
      serviceLocator(),
    ),
  );

  // Register Repository
  serviceLocator.registerFactory<SignUpRepository>(
    () => SignUpRepositoryImpl(
      serviceLocator(),
    ),
  );

  // Register UseSignUp
  serviceLocator.registerFactory<UseSignUp>(
    () => UseSignUp(
      serviceLocator(),
    ),
  );

  // Register SignupBloc
  serviceLocator.registerLazySingleton<SignupBloc>(
    () => SignupBloc(
      useSignUp: serviceLocator(),
    ),
  );
}

void _initLogin() {
  // Register Data Sources
  serviceLocator.registerLazySingleton<LoginDatasource>(
    () => LoginDatasourceImpl(
      serviceLocator(),
    ),
  );

  // Register Repository
  serviceLocator.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      serviceLocator(),
    ),
  );

  // Register UseSignIn
  serviceLocator.registerFactory<UseSignIn>(
    () => UseSignIn(
      serviceLocator(),
    ),
  );

  // Register UseCurrentUser
  serviceLocator.registerFactory<UseCurrentUser>(
    () => UseCurrentUser(serviceLocator()),
  );

  // Register LoginBloc
  serviceLocator.registerLazySingleton<LoginBloc>(
    () => LoginBloc(
      useSignIn: serviceLocator(),
      appUserCubit: serviceLocator(),
      useCurrentUser: serviceLocator(),
    ),
  );
}
