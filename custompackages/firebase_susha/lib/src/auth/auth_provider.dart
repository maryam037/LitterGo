
import 'package:firebase_susha/src/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize(options);
  AuthUser? get currentUser;
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  Future<void> logOut();
  Future<void> sendEmailVerification();
}
