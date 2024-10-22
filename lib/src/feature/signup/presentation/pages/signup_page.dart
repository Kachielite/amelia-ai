import 'package:amelia/src/feature/login/presentation/pages/login_page.dart';
import 'package:amelia/src/feature/signup/presentation/bloc/signup_bloc.dart';
import 'package:amelia/src/feature/signup/presentation/widgets/signup_form.dart';
import 'package:amelia/src/feature/signup/presentation/widgets/signup_info.dart';
import 'package:amelia/src/shared/presentation/widgets/feedback/custom_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../shared/presentation/widgets/form/custom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: BlocConsumer<SignupBloc, SignupState>(
                listener: (context, state) {
                  if (state is SignupSuccess) {
                    showDialog(
                        context: context,
                        builder: (context) => const CustomDialogue(
                            image: "assets/feedback/sign_success_feedback.png",
                            title: "Sign up Successful!"));
                  }

                  if (state is SignupFailure) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 24, left: 24, right: 24, bottom: 24),
                        child: const Column(
                          children: [
                            SignUpInfo(),
                            SizedBox(
                              height: 50,
                            ),
                            SignUpForm(),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const LoginPage();
                                }));
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                    color: AppPallete.primaryColor,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Color(0XFF35383F)))),
                        padding: const EdgeInsets.only(
                            top: 24, left: 24, right: 26, bottom: 36),
                        child: CustomButton(
                            isLoading: state is SignupLoading ? true : false,
                            onPressed: () {},
                            label: 'Continue',
                            type: ButtonType.primary),
                      )
                    ],
                  );
                },
              ),
            ))
          ],
        )));
  }
}
