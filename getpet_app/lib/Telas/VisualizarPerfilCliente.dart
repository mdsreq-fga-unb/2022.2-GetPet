import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getpet/Telas/Principal.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class VisualizarPerfilCliente extends StatefulWidget {
  const VisualizarPerfilCliente({Key? key}) : super(key: key);

  @override
  State<VisualizarPerfilCliente> createState() => _VisualizarPerfilClienteState();
}

class _VisualizarPerfilClienteState extends State<VisualizarPerfilCliente> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return Scaffold(
            body: ListView(
              children: [
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: FirebaseFirestore.instance.collection("usuarios").doc(model.abrirPerfil).get(),
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
                const SizedBox(height: 5,),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: FirebaseFirestore.instance.collection("usuarios").doc(model.abrirPerfil).get(),
                    builder: (_, snapshott) {
                      if (snapshott.hasError) return const Text ('Erro');
                      if (snapshott.hasData) {
                        var dataa = snapshott.data!.data();
                        List<dynamic> avaliacoes = [];
                        dataa!["avaliacao"] != null ? avaliacoes = dataa["avaliacao"] : avaliacoes = [];
                        return Column(
                          children: [
                            Text(avaliacoes.isEmpty ? "Motorista ainda não possui avaliações" : "Avaliações:"),
                            ListView.builder(
                                itemCount: avaliacoes.isEmpty ? 0 : avaliacoes.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      Visibility(
                                        visible: avaliacoes[index] == 0 && index < 5,
                                        child: const Icon(Icons.star_outline),
                                      ),
                                      Visibility(
                                        visible: avaliacoes[index] == 1 && index < 5,
                                        child: Row(
                                          children: const [
                                            Icon(Icons.star_outline),
                                            Icon(Icons.star_outlined)
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: avaliacoes[index] == 2 && index < 5,
                                        child: Row(
                                          children: const [
                                            Icon(Icons.star_outlined),
                                            Icon(Icons.star_outlined),
                                            Icon(Icons.star_outlined)
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            ),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }
                ),
                const SizedBox(height: 5,),
                Container(
                  alignment: Alignment.center,
                  child: const Text("Últimas corridas"),
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("usuarios").doc(model.abrirPerfil).collection("pedidos").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return const Center(child: Text('Algo está errado!'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Row(
                        children: const [
                          Text("Carregando!"),
                          SizedBox(width: 5,),
                          SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator()
                          ),
                        ],
                      );
                    }
                    if(!snapshot.hasData){
                      return const Center(child: Text("Infelizmente você ainda não possui nada salvo"));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length > 5 ? 5 : snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        var temp = snapshot.data!.docs[index];
                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      const Icon(Icons.calendar_month),
                                      Text("${temp["data"]}: ${temp["dataChamado"]}"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      const Icon(Icons.category_outlined),
                                      Text("Categoria: ${temp["categoria"]}"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      const Icon(Icons.category_outlined),
                                      Text("Quantidade: ${temp["quantidade"]}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4, right: MediaQuery.of(context).size.width / 4),
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
              ],
            ),
          );
        }
    );
  }
}
