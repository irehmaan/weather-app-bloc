// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

enum AppStatus { unknown, authenticated, unauthenticated, signedUp }

class AuthState extends Equatable {
  final AppStatus appStatus;
  final auth.User? user;
  const AuthState({
    required this.appStatus,
    this.user,
  });

  factory AuthState.unknown() {
    return const AuthState(
      appStatus: AppStatus.unknown,
    );
  }

  @override
  List<Object?> get props => [appStatus, user];

  @override
  bool get stringify => true;

  AuthState copyWith({
    AppStatus? appStatus,
    auth.User? user,
  }) {
    return AuthState(
      appStatus: appStatus ?? this.appStatus,
      user: user ?? this.user,
    );
  }
}
