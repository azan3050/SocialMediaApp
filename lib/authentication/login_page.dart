import 'package:flutter/material.dart';
import 'package:riyal_talks/authentication/auth_page.dart';

class LoginPage extends StatefulWidget {
   final VoidCallback showSignUpPage;
   const LoginPage({super.key, required this.showSignUpPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _passwordVisible = true;
  }

  void login() async{
    final authPage = AuthPage();
    try{
      await authPage.signInWithEmailPassword(
          _emailController.text,
          _passwordController.text);
    } catch(e) {
      // ignore: use_build_context_synchronously
      showDialog(context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  height: 250,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                      )
                    ),
                  ),
                ),
                const Text('Welcome To RiyalTalks!',
                style: TextStyle(
                  fontSize: 30,
                ),),
                const SizedBox(height: 10,),
                const Text('Login',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20,),
                TextField(
                  controller: _emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      label: const Text('Username'),
                      suffixIcon: const Icon(Icons.person,)
                  )
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                        label: const Text('Password'),
                        //icon: Icon(Icons.lock,),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                        ), onPressed: (){
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                        },
                    ),
                )
                ),
                const SizedBox(height: 8,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(onPressed: () {},
                      child: const Text('Forgot Password ?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey
                      ),)),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 1000,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text(
                        'LOGIN',
                        style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    ),),),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do not have an account ?', style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),),
                    const SizedBox(width: 10,),
                     GestureDetector(
                       onTap: widget.showSignUpPage,
                       child: const Text('Sign Up', style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey,
                    ),),
                     ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
