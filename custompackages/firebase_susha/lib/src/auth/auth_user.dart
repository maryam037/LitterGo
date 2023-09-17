import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;
  final String uid;
  const AuthUser(this.isEmailVerified, this.uid);

  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified, user.uid);
  //this factory constructor takes the email verified variable from the firebase user and
  //put its in our own AuthUser class which has the object "isEmailVerified"
}
