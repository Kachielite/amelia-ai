import 'package:amelia/src/feature/login/presentation/bloc/login_bloc.dart';
import 'package:amelia/src/feature/login/presentation/widgets/login_form.dart';
import 'package:amelia/src/feature/signup/presentation/pages/signup_page.dart';
import 'package:amelia/src/feature/signup/presentation/widgets/signup_info.dart';
import 'package:amelia/src/shared/presentation/widgets/feedback/custom_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../shared/presentation/widgets/form/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          // Added SingleChildScrollView to handle overflow
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                showDialog(
                    context: context,
                    builder: (context) => const CustomDialogue(
                        image: "assets/feedback/login_successful.png",
                        title: "Log in Successful!"));

                // Wrap context check inside the closure and add mounted check
                Future.delayed(const Duration(seconds: 10), () {
                  if (mounted && Navigator.canPop(context)) {
                    // Ensure context is still valid
                    Navigator.of(context).pop();
                  }
                });
              }

              if (state is LoginFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 32),
                    margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0XFF35383F)))),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SignUpInfo(),
                          const SizedBox(
                            height: 32,
                          ),
                          LoginForm(
                            emailController: emailController,
                            passwordController: passwordController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: AppPallete.primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account?',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignUpPage();
                              }));
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: AppPallete.primaryColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border:
                            Border(top: BorderSide(color: Color(0XFF35383F)))),
                    padding: const EdgeInsets.only(
                        top: 24, left: 24, right: 26, bottom: 32),
                    child: CustomButton(
                        isLoading: state is LoginLoading ? true : false,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(Login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim()));
                          }
                        },
                        label: 'Log in',
                        type: ButtonType.primary),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
