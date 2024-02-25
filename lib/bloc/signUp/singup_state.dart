// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'singup_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SingupState extends Equatable {
  final SignUpStatus signUpStatus;
  final CustomError error;
  SingupState({
    required this.signUpStatus,
    required this.error,
  });

  factory SingupState.initial() {
    return SingupState(
        signUpStatus: SignUpStatus.initial, error: CustomError());
  }

  @override
  List<Object> get props => [signUpStatus, error];

  SingupState copyWith({
    SignUpStatus? signUpStatus,
    CustomError? error,
  }) {
    return SingupState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;
}
