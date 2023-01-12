import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getpet/Widgets/VerPerfil.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: Column(
                                    children: [
                                      IntlPhoneField(
                                        decoration: const InputDecoration(
                                          labelText: 'Número de celular',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
                                        ),
                                        initialCountryCode: 'BR',
                                        onChanged: (phone) {
                                          numeroCelular = phone.completeNumber;
                                        },
                                      ),
                                      Text("Atual: ${data["numero"]}"),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white
                                    ),
                                    child: const Text("Atualizar", style: TextStyle(color: Colors.black87),),
                                    onPressed: () async{
                                      if(nomeControlador.text.isNotEmpty && (numeroCelular != "" && numeroCelular != "+55")){
                                        await FirebaseFirestore.instance.collection("usuarios").doc(model.firebaseUser!.uid).update({
                                          "usuario": nomeControlador.text,
                                          "numero": numeroCelular
                                        });
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => const VerPerfil())
                                        );
                                      } else if(nomeControlador.text.isEmpty && (numeroCelular != "" && numeroCelular != "+55")){
                                        await FirebaseFirestore.instance.collection("usuarios").doc(model.firebaseUser!.uid).update({
                                          "numero": numeroCelular
                                        });
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => const VerPerfil())
                                        );
                                      } else if(nomeControlador.text.isNotEmpty && (numeroCelular == "" || numeroCelular == "+55")){
                                        await FirebaseFirestore.instance.collection("usuarios").doc(model.firebaseUser!.uid).update({
                                          "usuario": nomeControlador.text
                                        });
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => const VerPerfil())
                                        );
                                      }else{
                                        _aviso();
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white
                                    ),
                                    child: const Text("Voltar", style: TextStyle(color: Colors.black87),),
                                    onPressed: (){
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => const VerPerfil())
                                      );
                                    },
                                  ),
                                ),
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