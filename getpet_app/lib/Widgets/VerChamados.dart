import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getpet/Widgets/AbrirChamado.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:latlong2/latlong.dart';

class VerChamados extends StatefulWidget {
  const VerChamados({Key? key}) : super(key: key);

  @override
  State<VerChamados> createState() => _VerChamadosState();
}

class _VerChamadosState extends State<VerChamados> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection("pedidos").snapshots(),
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
              if(!model.servidor){
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    var temp = snapshot.data!.docs[index];
                    return Card(
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
                    );
                  },
                );
              }else{
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    var temp = snapshot.data!.docs[index];
                    Distance distancia = const Distance();
                    return Card(

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                                const Icon(Icons.social_distance_outlined),
                                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                                  future: FirebaseFirestore.instance.collection("usuarios").doc(model.firebaseUser!.uid).get(),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasError) return Text ('Error = ${snapshot.error}');
                                    if (snapshot.hasData) {
                                      var data = snapshot.data!.data();
                                      return Text("Distância: ${distancia.as(LengthUnit.Kilometer, LatLng(temp["latitude"], temp["longitude"]), LatLng(data!["latitude"], data["longitude"]))} Km");
                                    }
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                                const Icon(Icons.social_distance_outlined),
                                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                                    future: FirebaseFirestore.instance.collection("usuarios").doc(model.firebaseUser!.uid).get(),
                                    builder: (_, snapshot) {
                                      if (snapshot.hasError) return Text ('Error = ${snapshot.error}');
                                      if (snapshot.hasData) {
                                        var data = snapshot.data!.data();
                                        return Text("Valor: ${((distancia.as(LengthUnit.Kilometer, LatLng(temp["latitude"], temp["longitude"]), LatLng(data!["latitude"], data["longitude"]))*3)).toStringAsFixed(2)} R\$");
                                      }
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                                const Icon(Icons.pets_rounded),
                                Text(temp["qualPet"])
                              ],
                            ),
                            MaterialButton(
                              onPressed: () {
                                model.idChamado = temp.id;
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const AbrirChamado())
                                );
                              },
                              color: Colors.black87,
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.arrow_forward_rounded,
                                size: 13,
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        }
    );
  }
}

