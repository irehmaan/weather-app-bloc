import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../model/custom_error.dart';


class AuthRepo {
  final auth.FirebaseAuth firebaseAuth;
  AuthRepo({
    required this.firebaseAuth,
  });
 

  Stream<auth.User?> get user => firebaseAuth.userChanges();

  Future<void> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on auth.FirebaseException catch (e) {
      throw CustomError(code: e.code, message: e.message!, exception: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Error occured',
          message: e.toString(),
          exception: 'Firebase/App error');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on auth.FirebaseException catch (e) {
      throw CustomError(code: e.code, message: e.message!, exception: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Error occured',
          message: e.toString(),
          exception: 'Firebase/App error');
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on auth.FirebaseException catch (e) {
      throw CustomError(code: e.code, message: e.message!, exception: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Error occured',
          message: e.toString(),
          exception: 'Firebase/App error');
    }
  }
}
