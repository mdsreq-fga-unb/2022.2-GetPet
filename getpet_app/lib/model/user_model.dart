// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp(
      {required Map<String, dynamic> userData,
      required String password,
      required VoidCallback onSuccess, // É um apelido para void Funtion()
      required void Function(String e) onFail}) {
    isLoading = true;
    notifyListeners();
    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: password)
        .then((auth) async {
      firebaseUser = auth.user!;
      _saveUserData(userData);
      await FirebaseFirestore.instance
          .collection('users')
          .doc("{firebaseUser!.uid}")
          .get();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });
  }

  Future _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser!.uid)
        .set(userData);
  }
}
