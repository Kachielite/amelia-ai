import 'package:amelia/src/core/theme/theme.dart';
import 'package:amelia/src/feature/login/presentation/bloc/login_bloc.dart';
import 'package:amelia/src/feature/onboarding/presentation/page/onboarding_page.dart';
import 'package:amelia/src/feature/signup/presentation/bloc/signup_bloc.dart';
import 'package:amelia/src/shared/app_injection.dart';
import 'package:amelia/src/shared/presentation/bloc/app_user_cubit/app_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<SignupBloc>()),
        BlocProvider(create: (_) => serviceLocator<LoginBloc>()),
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(LoginUserLoggedIn());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amelia AI',
      theme: AppTheme.appTheme,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          if (state is AppUserIsLoggedIn) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const Center(
              child: Text('User is logged in'),
            );
          } else {
            return const OnboardingPage();
          }
        },
      ),
    );
  }
}
