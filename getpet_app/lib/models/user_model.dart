import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class UserModel extends Model {
  late String uidd;
  late bool logado;
  late bool servidor;
  String nome = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaseUser;
  Map<String, dynamic> userData = Map();
  late String idChamado;


  bool isLoading = false;

  void signUp({required Map<String, dynamic> userData, required String pass, required VoidCallback onSuccess, required VoidCallback onFail}){
    isLoading = true;
    notifyListeners();
    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass
    ).then((auth) async{
      firebaseUser = auth.user!;
      await _saveUserData(userData);
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(
          'usuarios').doc("${firebaseUser!.uid}").get();
      snapshot["ocupacao"] == "servidor" ? servidor = true : servidor = false;
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      print(e);
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }
  void signIn({required String email, required String pass, required VoidCallback onSuccess, required VoidCallback onFail}) async{
    isLoading = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
            (auth) async{
          firebaseUser = auth.user!;
          DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(
              'usuarios').doc(firebaseUser!.uid).get();
          snapshot["ocupacao"] == "servidor" ? servidor = true : servidor = false;
          //servidor = false;
          onSuccess();
          isLoading = false;
          notifyListeners();
        }).catchError((e){
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }
  void recuperarSenha(String email){
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  void signOut() async{
    print(isLoggedIn());
    //await FirebaseAuth.instance.signOut();
    //print(isLoggedIn());
    await _auth.signOut();
    nome = "";
    userData = Map();
    notifyListeners();
  }

  void nomeUsuario() async{
    if(isLoggedIn() == true) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(
          'usuarios').doc("${firebaseUser!.uid}").get();
      nome = snapshot["usuario"].toString();
      notifyListeners();
    }
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async{
    this.userData = userData;
    await FirebaseFirestore.instance.collection("usuarios").doc(firebaseUser!.uid).set(userData);
    await FirebaseFirestore.instance.collection("usuarios").doc(firebaseUser!.uid).update({"administrador" : false});
  }

}
