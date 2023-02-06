import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getpet/Telas/Principal.dart';
import 'package:getpet/Telas/VisualizarPerfilCliente.dart';
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
  bool mostrouInteresse = false;
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
                    List<dynamic> motoristas = [];
                    data!["interesse"] == true ? motoristas = data["motoristas"] : motoristas = [];
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 40,),
                            Text(data["categoria"], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
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
                            Visibility(
                              visible: model.servidor,
                              child: Column(
                                children: [
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
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width / 2) - 12.5,
                                    child: ElevatedButton(
                                      child:  const Text("Ver perfil"),
                                      onPressed: () async{
                                        model.abrirPerfil = data["idCliente"];
                                        model.abrirPerfil = model.abrirPerfil.replaceAll(' ', '');
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => const VisualizarPerfilCliente())
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: ElevatedButton(
                                      child: const Text("Mostrar interesse"),
                                      onPressed: () async{
                                        List<dynamic> motoristasSuporte = motoristas;
                                        if(mostrouInteresse == true){
                                          _falha();
                                        }else{
                                          if(motoristasSuporte.contains(model.firebaseUser!.uid)){
                                            _falha();
                                          }else{
                                            motoristasSuporte.add(model.firebaseUser!.uid);
                                            await FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).update({
                                              "interesse": true,
                                              "motoristas": motoristasSuporte,
                                            });
                                            _sucesso();
                                            mostrouInteresse = true;
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                  Visibility(
                                    visible: data["motoristaFinal"] && data["motoristaFinalId"] == model.firebaseUser!.uid,
                                    child: ElevatedButton(
                                      child:  const Text("Confirmar Pagamento"),
                                      onPressed: () async{
                                        FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).update({
                                          "pago": true,
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Visibility(
                              visible: !model.servidor,
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: !data["pago"],
                                    child: Column(
                                      children: [
                                        const Text("Motoristas Interessados:", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                                        ListView.builder(
                                            itemCount: motoristas.isEmpty ? 0 : motoristas.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index){
                                              return Card(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                    children: [
                                                      FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                                                          future: FirebaseFirestore.instance.collection("usuarios").doc(motoristas[index]).get(),
                                                          builder: (_, snapshott) {
                                                            if (snapshott.hasError) return const Text ('Erro');
                                                            if (snapshott.hasData) {
                                                              var dataa = snapshott.data!.data();
                                                              return Text(dataa!["usuario"], style: const TextStyle(fontSize: 15),);
                                                            }
                                                            return const Center(child: CircularProgressIndicator());
                                                          }
                                                      ),
                                                      TextButton(
                                                        child: const Text("Visitar perfil", style: TextStyle(fontSize: 15),),
                                                        onPressed: () async{
                                                          model.abrirPerfil = motoristas[index];
                                                          model.abrirPerfil = model.abrirPerfil.replaceAll(' ', '');
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(builder: (context) => const VisualizarPerfilCliente())
                                                          );
                                                        },
                                                      ),
                                                      Visibility(
                                                          visible: !data["motoristaFinal"],
                                                          child: TextButton(
                                                            child: const Text("Aceitar", style: TextStyle(fontSize: 15),),
                                                            onPressed: () async{
                                                              await FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).update({
                                                                "motoristaFinal": true,
                                                                "motoristaFinalId": motoristas[index],
                                                              });
                                                            },
                                                          )
                                                      ),
                                                      Visibility(
                                                        visible: data["motoristaFinalId"] == motoristas[index] && data["motoristaFinal"],
                                                        child: TextButton(
                                                          child: const Text("Remover", style: TextStyle(fontSize: 15),),
                                                          onPressed: () async{
                                                            await FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).update({
                                                              "motoristaFinal": false,
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                        ),
                                        const SizedBox(height: 10,),
                                      ],
                                    ),
                                  ),
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
                                  const SizedBox(height: 10,),
                                  Visibility(
                                    visible: data["pago"],
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.star_outline_rounded),
                                              onPressed: () async{
                                                if(data["avaliacao"]){
                                                  _avaliacaoFalha();
                                                }else{
                                                  List<dynamic> avaliacoes = [];
                                                  await FirebaseFirestore.instance.collection("usuarios").doc(data["motoristaFinalId"]).get().then((value) => {
                                                    avaliacoes = value.data()!["avaliacao"]
                                                  });
                                                  if(avaliacoes == null){
                                                    avaliacoes = [0];
                                                  }else{
                                                    avaliacoes.insert(0, 0);
                                                  }
                                                  await FirebaseFirestore.instance.collection("usuarios").doc(data["motoristaFinalId"]).update({
                                                    "avaliacao": avaliacoes,
                                                  });
                                                  await FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).update({
                                                    "avaliacao": true,
                                                  });
                                                  _avaliacaoSucesso();
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.star_half_outlined),
                                              onPressed: () async{
                                                if(data["avaliacao"]){
                                                  _avaliacaoFalha();
                                                }else{
                                                  List<dynamic> avaliacoes = [];
                                                  await FirebaseFirestore.instance.collection("usuarios").doc(data["motoristaFinalId"]).get().then((value) => {
                                                    avaliacoes = value.data()!["avaliacao"]
                                                  });
                                                  if(avaliacoes == null){
                                                    avaliacoes = [1];
                                                  }else{
                                                    avaliacoes.insert(0, 1);
                                                  }
                                                  await FirebaseFirestore.instance.collection("usuarios").doc(data["motoristaFinalId"]).update({
                                                    "avaliacao": avaliacoes,
                                                  });
                                                  await FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).update({
                                                    "avaliacao": true,
                                                  });
                                                  _avaliacaoSucesso();
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.star_outlined),
                                              onPressed: () async{
                                                if(data["avaliacao"]){
                                                  _avaliacaoFalha();
                                                }else{
                                                  List<dynamic> avaliacoes = [];
                                                  await FirebaseFirestore.instance.collection("usuarios").doc(data["motoristaFinalId"]).get().then((value) => {
                                                    avaliacoes = value.data()!["avaliacao"]
                                                  });
                                                  if(avaliacoes == null){
                                                    avaliacoes = [2];
                                                  }else{
                                                    avaliacoes.insert(0, 2);
                                                  }
                                                  await FirebaseFirestore.instance.collection("usuarios").doc(data["motoristaFinalId"]).update({
                                                    "avaliacao": avaliacoes,
                                                  });
                                                  await FirebaseFirestore.instance.collection("pedidos").doc(model.idChamado).update({
                                                    "avaliacao": true,
                                                  });
                                                  _avaliacaoSucesso();
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ),
                                ],
                              )
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

  void _sucesso() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Interesse adicionado!\nNão esquece de enviar uma mensagem no zap!"),
    ));
  }
  void _falha() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Você já demonstrou interesse por essa corrida!"),
    ));
  }
  void _avaliacaoSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Avaliação feita com sucesso!"),
    ));
  }

  void _avaliacaoFalha() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Você já realizou a avaliação!"),
    ));
  }
}
