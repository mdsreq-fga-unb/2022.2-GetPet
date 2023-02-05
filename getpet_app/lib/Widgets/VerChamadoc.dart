import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getpet/Widgets/AbrirChamado.dart';
import 'package:getpet/Widgets/VerChamado.dart';
import 'package:getpet/Widgets/VerPerfil.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class VerChamadoc extends StatefulWidget {
  const VerChamadoc({Key? key}) : super(key: key);

  @override
  State<VerChamadoc> createState() => _VerChamadocState();
}

class _VerChamadocState extends State<VerChamadoc> {
  int currentIndex = 0;
  var pagesServidor = const [
    VerChamado(),
    VerPerfil(),
  ];
  var pagesCliente = const [
    VerPerfil(),
  ];
  var _appPageController = PageController();

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pedidos").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Algo está errado!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Row(
              children: const [
                Text("Carregando!"),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                    width: 16, height: 16, child: CircularProgressIndicator()),
              ],
            );
          }
          if (!snapshot.hasData) {
            return const Center(
                child: Text("Infelizmente você ainda não possui nada salvo"));
          }
          if (snapshot.data!.size == 0) {
            return const Center(
                child: Text("Infelizmente você ainda não possui nada salvo"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var temp = snapshot.data!.docs[index];
              return Visibility(
                visible: temp["idCliente"].replaceAll(' ', '') ==
                    model.firebaseUser!.uid,
                child: Card(
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
                            const Icon(Icons.format_list_numbered_rounded),
                            Text("Quantidade: ${temp["quantidade"]}"),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {
                            model.chamadoServidor = false;
                            model.idChamado = temp.id;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AbrirChamado()));
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
                ),
              );
            },
          );
        },
      );
    });
  }
}
