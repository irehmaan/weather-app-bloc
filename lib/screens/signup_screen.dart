import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/signUp/singup_cubit.dart';
import '../common/custom_textfield.dart';
import '../common/error_dialog.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  void _signUp(BuildContext context) {
    if (username.text.isEmpty || password.text.isEmpty) {
      return;
    } else {
      context
          .read<SingupCubit>()
          .signUp(email: username.text, password: password.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SingupCubit, SingupState>(
          listener: (context, state) {
            if (state.signUpStatus == SignUpStatus.error) {
              return errorDialog(context, state.error);
            }
            if (state.signUpStatus == SignUpStatus) {}
            ;
          },
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Lets' get you started with a new account !"),
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
                        onPressed: () => _signUp(context),
                        child: Text(
                          state.signUpStatus == SignUpStatus.submitting
                              ? "signing-up"
                              : "Sign-up",
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Login "))
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
