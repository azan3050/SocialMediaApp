import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = '';
  String _profilePicture = '';

  final _usernameController = TextEditingController();

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePicture = pickedFile.path;
      });
    } //else {
    //     setState(() {
    //       _profilePicture = 'assets/profile.png';
    //     });
    //   }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P R O F I L E'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _profilePicture.isNotEmpty
                  ? FileImage(File(_profilePicture))
                  : null,
              child: _profilePicture.isEmpty
                  ? const Icon(Icons.person, size: 50)
                  : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _getImage();
              },
              child: const Text('Upload Profile Picture'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _username.isNotEmpty
                  ? () {
                      // Add code to save the username and profile picture to Firebase
                      // and navigate back to the previous page
                    }
                  : null,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
