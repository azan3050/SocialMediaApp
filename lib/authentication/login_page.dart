import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;

  @override
  void initState(){
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
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
                    onPressed: () {},
                    child: const Text(
                        'LOGIN',
                        style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    ),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      backgroundColor: Colors.blueGrey,
                    ),),
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do not have an account ?', style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),),
                    SizedBox(width: 10,),
                    Text('SignUp', style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                    ),)
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
