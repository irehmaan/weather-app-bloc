import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';

import '../bloc/theme/theme_cubit.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showDialog(
              barrierColor: Colors.transparent,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.blueGrey.shade400,
                  alignment: AlignmentDirectional.topCenter,
                  content: SizedBox(
                    height: size.height / 3,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.clear)),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: SizedBox(
                              height: size.height / 11,
                              width: size.width,
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      tileColor: Colors.transparent,
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(19),
                                        child: state.user!.photoURL == null
                                            ? Image.asset(
                                                'assets/icons/user.png',
                                                height: 40,
                                              )
                                            : Image.network(
                                                state.user!.photoURL!,
                                                height: 40,
                                              ),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(state.user!.displayName ??
                                              'user'),
                                          Text(state.user!.email!),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(SignOut());
                              },
                              child: const Text("Sign - out")),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  context.read<ThemeCubit>().state.enabled
                                      ? "Dark Mode"
                                      : " Light Mode"),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Switch(
                                    value: context
                                        .read<ThemeCubit>()
                                        .state
                                        .enabled,
                                    onChanged: (value) {
                                      context
                                          .read<ThemeCubit>()
                                          .enableDarkTheme(value);
                                    })),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(19),
              child: state.user!.photoURL == null
                  ? Image.asset('assets/icons/user.png')
                  : Image.network(
                      state.user!.photoURL!,
                    ),
            ),
          ),
        );
      },
    );
  }
}
