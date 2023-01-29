import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getpet/Telas/Cadastro.dart';
import 'package:getpet/Telas/Principal.dart';
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
                      height: 10,
                    ),
                    TextButton(
                      child: const Text("Esqueci minha senha"),
                      onPressed: () {
                        if (emailControlador.text!.contains("@")) {
                          model.recoverPass(emailControlador.text);
                          _recuperarSenha();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text("Login"),
                        onPressed: () {
                          if (validarFormulario()) {
                            model.signIn(
                                email: emailControlador.text,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text("Cadastrar"),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Cadastro()));
                        },
                      ),
                    ),
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

  void _recuperarSenha() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text("Uma mensagem foi enviada para ${emailControlador.text}!"),
    ));
  }
}
