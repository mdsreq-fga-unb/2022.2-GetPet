// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaseUser;
  Map<String, dynamic> userData = {};

  void signUp(
      {required Map<String, dynamic> userData, required String password}) {
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
      notifyListeners();
    }).catchError((e) {
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
