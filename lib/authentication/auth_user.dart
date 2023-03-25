import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser(this.isEmailVerified);

  //creates an AuthUser from a Firebase User
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
//the 'User' here means the Firebase user
