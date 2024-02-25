import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/signUp/singup_cubit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    if (context.read<SingupCubit>().state.signUpStatus ==
        SignUpStatus.success) {
      setState(() {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Sign Up Successful'),
            content: Text(
                'Your account has been successfully created. Log-in via your credentials'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  // Navigator.pushNamed(context, '/login');
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // print('builder $state');
        if (state.appStatus == AppStatus.unauthenticated) {
          Navigator.pushNamed(context, '/login');
        }

        if (state.appStatus == AppStatus.authenticated) {
          Navigator.pushNamed(context, '/home');
        }
      },
      builder: (context, state) {
        // print('User is ${state.user}');
        return const Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
