import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getpet/Telas/Principal.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user_model.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailControlador = TextEditingController();
  TextEditingController senhaControlador = TextEditingController();
  TextEditingController nomeControlador = TextEditingController();
  TextEditingController cpfControlador = TextEditingController();
  TextEditingController modeloControlador = TextEditingController();
  TextEditingController placaControlador = TextEditingController();
  late String numeroCelular;
  bool isMotorista = false;
  String cliente = "Sou cliente";

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: const [
                FaIcon(
                  FontAwesomeIcons.shieldDog,
                  size: 31,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Get-Pet",
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  "Cadastro",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: nomeControlador,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "Nome",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                        validator: (text) {
                          if (text!.isEmpty || text!.length > 30) {
                            return "Certeza que esse é um nome válido?";
                          } else
                            return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: cpfControlador,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "CPF",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                        validator: (text) {
                          if (text!.isEmpty || text.length != 11) {
                            return "CPF inválido";
                          } else
                            return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: emailControlador,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                        validator: (text) {
                          if (!text!.contains("@")) {
                            return "Certeza que esse é um e-mail válido?";
                          } else
                            return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: IntlPhoneField(
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
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: senhaControlador,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "Senha",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                        validator: (text) {
                          if (text!.length < 6) {
                            return "6 dígitos de senha no mínimo";
                          } else
                            return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isMotorista = !isMotorista;
                            cliente == "Sou cliente"
                                ? cliente = "Sou motorista"
                                : cliente = "Sou cliente";
                          });
                        },
                        child: Text(cliente)),
                    const SizedBox(
                      height: 5,
                    ),
                    Visibility(
                        visible: isMotorista,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 50,
                              child: TextFormField(
                                controller: modeloControlador,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: "Modelo do Carro",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide()),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 50,
                              child: TextFormField(
                                controller: placaControlador,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: "Placa do Carro",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide()),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text("Cadastrar"),
                        onPressed: () {
                          if (validarFormulario()) {
                            Map<String, dynamic> userData = {
                              "email": emailControlador.text,
                              "latitude": 666,
                              "longitude": 666,
                              "numero": numeroCelular,
                              "ocupacao": "cliente",
                              "placa": placaControlador.text,
                              "modelo": modeloControlador.text,
                              "usuario": nomeControlador.text,
                            };
                            model.signUp(
                                userData: userData,
                                pass: senhaControlador.text,
                                onSuccess: _sucesso,
                                onFail: _falha);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /*SizedBox(
                              width: MediaQuery.of(context).size.width - 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                                child: const Text("Login"),
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const Entrar())
                                  );
                                },
                              ),
                            ),*/
                  ],
                )),
          ],
        )),
      );
    });
  }

  bool validarFormulario() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    }
    return false;
  }

  void _sucesso() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Principal()));
  }

  void _falha() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Algo deu errado!"),
    ));
  }
}
