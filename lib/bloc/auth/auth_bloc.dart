import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:weatherapp/repo/hive_repo.dart';

import '../../model/user_model.dart';
import '../../repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final HiveRepository hiveRepository;
  final AuthRepo authRepo;
  late final StreamSubscription authSubscription;
  /*
  auth bloc start with an unknwon state at first.
  And takes necessary params like authRepo, hiveRepo as well.
  We are also lisetning to the changes in user Stream from our auth bloc
  based on that stream we are updating the user. As it emits a stream from firebase.userChanges()
  */
  AuthBloc({required this.authRepo, required this.hiveRepository})
      : super(AuthState.unknown()) {
    authSubscription = authRepo.user.listen((auth.User? user) {
      add(AuthStatusChange(user: user));
    });

    on<AuthStatusChange>((event, emit) {
      // emit authenticated state if user is not null and save as well as update user model.

      if (event.user != null) {
        final userModel = UserModel(
          uid: event.user!.uid,
          displayName: event.user!.displayName,
          email: event.user!.email,
        );
        emit(state.copyWith(
            appStatus: AppStatus.authenticated, user: event.user));
        hiveRepository.saveUser(userModel);
      } else {
        emit(state.copyWith(appStatus: AppStatus.unauthenticated, user: null));
        // del user in case of error
        hiveRepository.deleteUser();
      }
    });
    // deleting user when we are signing out
    on<SignOut>((event, emit) async {
      await authRepo.signOut();
      hiveRepository.deleteUser();
    });
  }
}
