// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:intl/intl.dart';

class FazerChamado extends StatefulWidget {
  const FazerChamado({Key? key}) : super(key: key);

  @override
  State<FazerChamado> createState() => _FazerChamadoState();
}

class _FazerChamadoState extends State<FazerChamado> {
  double latitude = 666;
  double longitude = 666;
  final _comentario = TextEditingController();
  final List<String> precisa = [
    'Ida',
    'Ida e volta',
    'Ida e volta com espera',
  ];
  final List<String> quantia = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6 ou +',
  ];
  final List<String> pet = [
    'Cachorro',
    'Gato',
    'Cachorro e gato',
  ];
  final List<String> quando = [
    'Hoje',
    'Amanhã',
    'Nesta semana',
    'Próxima semana',
    'Próximas semanas',
  ];
  String precisaValor = "Ida";
  String quantiaValor = "1";
  String petValor = "Cachorro";
  String quandoValor = "Hoje";
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return LayoutBuilder(
        builder: (context, constrains) => ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
                child: Text(
              "Realizar Chamado:",
              style: TextStyle(fontSize: 28),
            )),
            const SizedBox(
              height: 15,
            ),
            const Center(child: Text("Do que você precisa?")),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Selecionar',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: precisa
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: precisaValor,
                  onChanged: (value) {
                    setState(() {
                      precisaValor = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black87,
                  iconDisabledColor: Colors.black87,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(child: Text("Qual a quantidade de pets?")),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Selecionar',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: quantia
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: quantiaValor,
                  onChanged: (value) {
                    setState(() {
                      quantiaValor = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black87,
                  iconDisabledColor: Colors.black87,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(child: Text("Qual é o pet?")),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Selecionar',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: pet
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: petValor,
                  onChanged: (value) {
                    setState(() {
                      petValor = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black87,
                  iconDisabledColor: Colors.black87,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(child: Text("Para quando será necessário?")),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Selecionar',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: quando
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: quandoValor,
                  onChanged: (value) {
                    setState(() {
                      quandoValor = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black87,
                  iconDisabledColor: Colors.black87,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    geo.Position position =
                        await geo.Geolocator.getCurrentPosition(
                            desiredAccuracy: geo.LocationAccuracy.high);
                    latitude = position.latitude;
                    longitude = position.longitude;
                    _sucesso();
                  } catch (e) {
                    _falha();
                  }
                },
                child: const Text("Pegar Localização")),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: AutoSizeTextField(
                semanticsLabel: "Comentário",
                controller: _comentario,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                child: const Text("Solicitar"),
                onPressed: () async {
                  if (longitude == 666) {
                    _falha();
                  } else {
                    DocumentSnapshot snapshot = await FirebaseFirestore.instance
                        .collection('usuarios')
                        .doc(model.firebaseUser!.uid)
                        .get();
                    final DateTime now = DateTime.now();
                    final DateFormat formatter = DateFormat('dd/MM/yyyy');
                    final String formatted = formatter.format(now);
                    await FirebaseFirestore.instance
                        .collection("usuarios")
                        .doc(model.firebaseUser!.uid)
                        .collection("pedidos")
                        .doc()
                        .set({
                      "categoria": precisaValor,
                      "comentario": _comentario.text,
                      "data": quandoValor,
                      "dataChamado": formatted,
                      "latitude": latitude,
                      "longitude": longitude,
                      "nome": snapshot["usuario"],
                      "numero": snapshot["numero"],
                      "qualPet": petValor,
                      "quantidade": quantiaValor,
                    });
                    await FirebaseFirestore.instance
                        .collection("pedidos")
                        .doc()
                        .set({
                      "categoria": precisaValor,
                      "comentario": _comentario.text,
                      "data": quandoValor,
                      "dataChamado": formatted,
                      "latitude": latitude,
                      "longitude": longitude,
                      "nome": snapshot["usuario"],
                      "numero": snapshot["numero"],
                      "qualPet": petValor,
                      "quantidade": quantiaValor,
                    });
                    _comentario.clear();
                    _chamado();
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  void _sucesso() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Localização colhida com sucesso!"),
    ));
  }

  void _chamado() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Chamado feito com sucesso!"),
    ));
  }

  void _falha() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Algo deu errado colhendo a localização!"),
    ));
  }
}
