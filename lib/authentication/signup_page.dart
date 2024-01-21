import 'package:flutter/material.dart';
import 'package:riyal_talks/authentication/auth_page.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const SignUpPage({super.key, required this.showLoginPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _passwordVisible = true;
  }

  void signUp(BuildContext context){
    final _auth = AuthPage();

    //passwords match
    if(_passwordController.text == _confirmPasswordController.text){
      try{
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch(e){
        showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text(e.toString()),)
        );
      }
    }

    //passwords doesn't match
    else{
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords Don't Match!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                  height: 250,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/SignUpLogo.png'),
                        )
                    ),
                  ),
                ),
                const Text('Welcome To RiyalTalks!',
                  style: TextStyle(
                    fontSize: 30,
                  ),),
                const SizedBox(height: 10,),
                const Text('Create Account ',
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
                const SizedBox(height: 20,),
                TextField(
                  controller: _confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      label: const Text('Confirm Password'),
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
                const SizedBox(height: 20,),
                SizedBox(
                  width: 1000,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => signUp(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text(
                      'CREATE ACCOUNT',
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
                      onTap: widget.showLoginPage,
                      child: const Text('Login now', style: TextStyle(
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
