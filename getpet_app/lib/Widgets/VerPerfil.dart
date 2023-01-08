import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class VerPerfil extends StatefulWidget {
  const VerPerfil({Key? key}) : super(key: key);

  @override
  State<VerPerfil> createState() => _VerPerfilState();
}

class _VerPerfilState extends State<VerPerfil> {
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
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                        children: [
                          const SizedBox(height: 60,),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: Colors.black87)),
                            child: const Icon(
                              size: 30,
                              Icons.person_rounded,
                              color: Colors.black87,
                            ),
                          ),
                          Text(data!["usuario"]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                  children: [
                                    const Icon(Icons.mail_outline_rounded, size: 28, color: Colors.black87,),
                                    const SizedBox(width: 10,),
                                    Text(data["email"], style: const TextStyle(fontSize: 19),)
                                  ],
                                )
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                  children: [
                                    const Icon(Icons.phone_outlined, size: 28, color: Colors.black87,),
                                    const SizedBox(width: 10,),
                                    Text(data["numero"], style: const TextStyle(fontSize: 19),)
                                  ],
                                )
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
}