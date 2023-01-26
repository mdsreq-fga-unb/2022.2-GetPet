// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user_model.dart';

class Entrar extends StatefulWidget {
  const Entrar({Key? key}) : super(key: key);

  @override
  State<Entrar> createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailControlador = TextEditingController();
  TextEditingController senhaControlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 90)),
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
                  "Login",
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
                            return "Email inválido! Tente novamente.";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                            return "A senha deve ter no mínimo 6 dígitos";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ],
        )),
      );
    });
  }
}
