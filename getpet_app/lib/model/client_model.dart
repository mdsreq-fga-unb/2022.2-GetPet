// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

class ClientModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaseClient;
  Map<String, dynamic> clientData = {};

  void signUp(
      {required Map<String, dynamic> clientData, required String password}) {
    notifyListeners();
    _auth
        .createUserWithEmailAndPassword(
            email: clientData["email"], password: password)
        .then((auth) async {
      firebaseClient = auth.user!;
      _saveClientData(clientData);
      await FirebaseFirestore.instance
          .collection('clients')
          .doc("{firebaseUser!.uid}")
          .get();
      notifyListeners();
    }).catchError((e) {
      notifyListeners();
    });
  }

  Future _saveClientData(Map<String, dynamic> clientData) async {
    this.clientData = clientData;
    await FirebaseFirestore.instance
        .collection("clients")
        .doc(firebaseClient!.uid)
        .set(clientData);
  }
}
