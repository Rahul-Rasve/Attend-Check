import 'package:attend_check/resources/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<void> initialize();
  
  Future<AuthUser> login({
    required String email,
    required String password,
  });

  Future<AuthUser> register({
    required String email,
    required String password,
  });

  Future<void> sendEmailVerification();
}
