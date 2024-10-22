import 'package:amelia/src/core/theme/theme.dart';
import 'package:amelia/src/feature/onboarding/presentation/page/onboarding_page.dart';
import 'package:amelia/src/feature/signup/presentation/bloc/signup_bloc.dart';
import 'package:amelia/src/shared/app_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocator<SignupBloc>())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amelia AI',
      theme: AppTheme.appTheme,
      home: const OnboardingPage(),
    );
  }
}
