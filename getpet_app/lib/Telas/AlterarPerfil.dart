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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: nomeControlador,
                                        obscureText: false,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          labelText: "Nome",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 0.0),
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide()),
                                        ),
                                        validator: (text){
                                          if(text!.isEmpty || text.length > 30) {
                                            return "Certeza que esse é um nome válido?";
                                          } else return null;
                                        },
                                      ),
                                      Text("Atual: ${data!["usuario"]}"),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15,),
                              ],
                            ),
                          ),
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
  void _aviso(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Você não alterou nenhum dado!"),
    ));
  }
}