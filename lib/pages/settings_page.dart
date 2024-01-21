import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('S E T T I N G S')),
      body: Center(
        child: Text(
          'Meri tarah iski bhi setting nahi hai',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
