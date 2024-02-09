import 'package:flutter/material.dart';
import 'package:riyal_talks/pages/profile_page.dart';
import 'package:riyal_talks/pages/settings_page.dart';

import '../authentication/auth_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

void logout() {
  final _authPage = AuthPage();
  _authPage.signOut();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 60),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.textsms_outlined,
                      size: 80,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.person,
                            size: 30,
                          ),
                          Text('P R O F I L E',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.home_filled,
                            size: 30,
                          ),
                          Text('H O M E',
                              style:  TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.settings_sharp,
                            size: 30,
                          ),
                          Text('S E T T I N G S',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.question_mark_sharp,
                            size: 30,
                          ),
                          Text('A B O U T',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: logout,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('L O G O U T',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                          Icon(Icons.login_outlined),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
