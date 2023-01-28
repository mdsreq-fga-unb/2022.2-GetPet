import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getpet/Telas/Principal.dart';
import 'package:getpet/Widgets/VerChamados.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class AbrirChamado extends StatefulWidget {
  const AbrirChamado({Key? key}) : super(key: key);

  @override
  State<AbrirChamado> createState() => _AbrirChamadoState();
}

class _AbrirChamadoState extends State<AbrirChamado> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return Scaffold(
            body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).get(),
                builder: (_, snapshot) {
                  if (snapshot.hasError) return Text ('Error = ${snapshot.error}');
                  if (snapshot.hasData) {
                    var data = snapshot.data!.data();
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 40,),
                            Text(data!["categoria"], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                SizedBox(
                                  width: (MediaQuery.of(context).size.width / 2) - 10,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.calendar_today_rounded, size: 25,),
                                          const SizedBox(width: 5,),
                                          Text(data["dataChamado"], style: const TextStyle(fontSize: 20),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (MediaQuery.of(context).size.width / 2) - 10,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const FaIcon(FontAwesomeIcons.calendarDay, size: 25,),
                                          const SizedBox(width: 5,),
                                          Text(data["data"], style: const TextStyle(fontSize: 15),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const FaIcon(FontAwesomeIcons.comment, size: 25,),
                                    const SizedBox(width: 5,),
                                    Text(data["comentario"], style: const TextStyle(fontSize: 20),)
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.pets_rounded, size: 25,),
                                    const SizedBox(width: 5,),
                                    Text(data["qualPet"], style: const TextStyle(fontSize: 20),)
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const FaIcon(FontAwesomeIcons.arrowUp19, size: 25,),
                                    const SizedBox(width: 5,),
                                    Text(data["quantidade"], style: const TextStyle(fontSize: 20),)
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person_rounded, size: 25,),
                                    const SizedBox(width: 5,),
                                    Text(data["nome"], style: const TextStyle(fontSize: 20),)
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                                SizedBox(
                                  width: (MediaQuery.of(context).size.width / 2) - 12.5,
                                  child: ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                      children: const [
                                        Icon(Icons.arrow_back),
                                        Text("Voltar"),
                                      ],
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => const Principal())
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                SizedBox(
                                  width: (MediaQuery.of(context).size.width / 2) - 12.5,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const FaIcon(FontAwesomeIcons.whatsapp),
                                    onPressed: () async{
                                      final link = WhatsAppUnilink(
                                          phoneNumber: data["numero"],
                                          text: "Oi, vi que voce precisa levar seu ${data["qualPet"]} na modalidade ${data["categoria"]}, podemos conversar?"
                                      );
                                      await launch('$link');
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
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
