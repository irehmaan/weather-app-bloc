part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStatusChange extends AuthEvent {
  final auth.User? user;
  const AuthStatusChange({
    this.user,
  });
  @override
  List<Object?> get props => [user];
}

class SignOut extends AuthEvent {}
