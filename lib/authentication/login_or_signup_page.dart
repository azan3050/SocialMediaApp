import 'package:flutter/material.dart';
import 'package:riyal_talks/authentication/signUp_page.dart';
import 'login_page.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {

    bool showLoginPage = true; //show login page initially

    void toggleScreens() {
      setState(() {
        showLoginPage = !showLoginPage;
      });
    }

    @override
    Widget build(BuildContext context) {
      if (showLoginPage) {
        return LoginPage(showSignUpPage: toggleScreens);
      } else {
        return SignUpPage(showLoginPage: toggleScreens);
      }
    }
  }
