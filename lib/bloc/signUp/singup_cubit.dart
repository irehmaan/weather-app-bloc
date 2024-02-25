import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repo/auth_repo.dart';

import '../../model/custom_error.dart';

part 'singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  final AuthRepo authRepo;
  SingupCubit({required this.authRepo}) : super(SingupState.initial());

  Future<void> signUp(
      {required String email, required String password, String? name}) async {
    try {
      emit(state.copyWith(signUpStatus: SignUpStatus.submitting));
      await authRepo.signUp(email: email, password: password).then((value) {
        authRepo.signOut();
      });
      
      emit(state.copyWith(signUpStatus: SignUpStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(error: e));
    }
  }
}
