import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signIn/sign_in_cubit.dart';
import '../common/custom_textfield.dart';
import '../common/error_dialog.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  void _signUserIn(BuildContext context) {
    if (username.text.isEmpty || password.text.isEmpty) {
      return;
    } else {
      context
          .read<SiginCubit>()
          .signIn(email: username.text, password: password.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<SiginCubit, SignInState>(
            listener: (context, state) {
              if (state.signInStatus == SignInStatus.error) {
                return errorDialog(context, state.error);
              }
              ;
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text("Welcome"),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomTextField(
                      controller: username,
                      title: 'E-mail',
                      hintText: 'Enter your e-mail',
                      obsucreText: false,
                    ),
                    CustomTextField(
                      controller: password,
                      title: 'Password',
                      hintText: 'Enter your password',
                      obsucreText: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 100,
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 69, 84, 85))),
                          onPressed: () => _signUserIn(context),
                          child: Text(
                            state.signInStatus == SignInStatus.submitting
                                ? "Signing in.."
                                : "Sign-in",
                          )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text("Sign up here "))
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
