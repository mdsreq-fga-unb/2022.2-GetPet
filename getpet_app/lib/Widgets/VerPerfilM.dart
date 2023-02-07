import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getpet/Telas/AlterarPerfil.dart';
import 'package:getpet/Telas/Entrar.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:geolocator/geolocator.dart' as geo;

class VerPerfilM extends StatefulWidget {
  const VerPerfilM({Key? key}) : super(key: key);

  @override
  State<VerPerfilM> createState() => _VerPerfilMState();
}

class _VerPerfilMState extends State<VerPerfilM> {
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                  children: [
                                    const Icon(Icons.signpost_outlined, size: 28, color: Colors.black87,),
                                    const SizedBox(width: 10,),
                                    Text(data["placa"], style: const TextStyle(fontSize: 19),)
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
                                    const Icon(Icons.car_repair_outlined, size: 28, color: Colors.black87,),
                                    const SizedBox(width: 10,),
                                    Text(data["modelo"], style: const TextStyle(fontSize: 19),)
                                  ],
                                )
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                              ),
                              child: const Text("Alterar Dados", style: TextStyle(color: Colors.black87),),
                              onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const AlterarPerfil())
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                              ),
                              child: const Text("Colher Localização", style: TextStyle(color: Colors.black87),),
                              onPressed: () async{
                                try{
                                  geo.Position position = await geo.Geolocator.getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
                                  double latitude = position.latitude;
                                  double longitude = position.longitude;
                                  await FirebaseFirestore.instance.collection("usuarios").doc(model.firebaseUser!.uid).update(
                                      {
                                        "longitude": longitude,
                                        "latitude": latitude,
                                      });
                                  _sucesso();
                                }catch(e){
                                  _falha();
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                              ),
                              child: const Text("Sair", style: TextStyle(color: Colors.black87),),
                              onPressed: (){
                                model.signOut();
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const Entrar())
                                );
                              },
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
  void _falha(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Algo deu errado colhendo a localização!"),
    ));
  }
  void _sucesso(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Localização colhida com sucesso!"),
    ));
  }
}
