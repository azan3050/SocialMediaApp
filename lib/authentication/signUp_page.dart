import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 400,
            height: 250,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/signUp_page.png'),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
