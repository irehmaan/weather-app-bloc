import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/custom_error.dart';
import '../../repo/auth_repo.dart';

part 'sign_in_state.dart';

class SiginCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SiginCubit({required this.authRepo}) : super(SignInState.initial());

  Future<void> signIn({required String email, required String password}) async {
    try {
      emit(state.copyWith(signInStatus: SignInStatus.submitting));
      await authRepo.signIn(email: email, password: password);
      emit(state.copyWith(signInStatus: SignInStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(signInStatus: SignInStatus.error, error: e));
    }
  }
}
