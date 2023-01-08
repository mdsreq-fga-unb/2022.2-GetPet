import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class AlterarPerfil extends StatefulWidget {
  const AlterarPerfil({Key? key}) : super(key: key);

  @override
  State<AlterarPerfil> createState() => _AlterarPerfilState();
}

class _AlterarPerfilState extends State<AlterarPerfil> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeControlador = TextEditingController();
  String numeroCelular = "";

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return Scaffold(
            body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance.collection("usuarios").doc(model.firebaseUser!.uid).get(),
                builder: (_, snapshot) {
                  if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                  if (snapshot.hasData) {
                    var data = snapshot.data!.data();
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 60,),

                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }
            ),
          );
        }
    );
  }
}