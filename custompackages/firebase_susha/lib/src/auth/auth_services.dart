
// ignore_for_file: unnecessary_cast

import 'package:firebase_susha/src/auth/auth_provider.dart';
import 'package:firebase_susha/src/auth/auth_user.dart';
import 'package:firebase_susha/src/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  AuthService(this.provider);

  factory AuthService.firebase() =>
      AuthService(FirebaseAuthProvider() as AuthProvider);

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize(options) => provider.initialize(options);
}
