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
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pedidos").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var temp = snapshot.data!.docs[index];
              return Card(
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          const Icon(Icons.calendar_month),
                          Text("${temp["data"]}: ${temp["dataChamado"]}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          const Icon(Icons.category_outlined),
                          Text("Categoria: ${temp["categoria"]}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
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
        },
      );
    });
  }
}
