import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthPage {
  //instance of auth
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  //instance of FireStore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _fireStore.collection('users').doc(userCredential.user!.uid).set(
          {
            'uid': userCredential.user!.uid,
            'email': email
          },
        SetOptions(merge: true)
      );

      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
           email: email, password: password);

       // after creating user
       _fireStore.collection('users').doc(userCredential.user!.uid).set(
           {
             'uid': userCredential.user!.uid,
             'email': email
           }
       );
       return userCredential;
    } on FirebaseException catch(e){
      throw Exception(e.code);
    }
  }
  //sign out
  Future<void> signOut() async{
    return await _auth.signOut();
  }
}