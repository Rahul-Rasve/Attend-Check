// ignore_for_file: prefer_const_constructors

import 'package:attend_check/authentication/auth_services.dart';
import 'package:attend_check/constants.dart';
import 'package:attend_check/screens/home_view.dart';
import 'package:attend_check/screens/login_view.dart';
import 'package:attend_check/screens/user_type.dart';
import 'package:attend_check/screens/verify_email_view.dart';
import 'package:attend_check/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'screens/register_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attend Check',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: authPage,
      routes: {
        homePage: (context) => HomePage(),
        loginPage: (context) => KeyboardVisibilityProvider(
              child: LoginView(),
            ),
        registerPage: (context) => KeyboardVisibilityProvider(
              child: RegisterView(),
            ),
        verifyEmailPage: (context) => VerifyEmailPage(),
        authPage: (context) => AuthPage(),
        userType: (context) => UserType(),
      },
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final user = AuthService.firebase().currentUser;
          if (user != null) {
            if (user.isEmailVerified) {
              return HomePage();
            } else {
              return VerifyEmailPage();
            }
          } else {
            return (!isTeacher && !isStudent) ? UserType() : LoginView();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: primary,
            ),
          );
        }
      },
    );
  }
}
