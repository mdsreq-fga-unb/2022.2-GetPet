import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:scoped_model/scoped_model.dart';
import '../model/user_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String phoneNumber;

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
                        controller: nameController,
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
                          if (text!.isEmpty || text.length > 30) {
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
                        controller: emailController,
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
                          phoneNumber = phone.completeNumber;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: passwordController,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text("Cadastrar"),
                        onPressed: () {
                          if (validarFormulario()) {
                            Map<String, dynamic> userData = {
                              "email": emailController.text,
                              "latitude": 666,
                              "longitude": 666,
                              "numero": phoneNumber,
                              "ocupacao": "cliente",
                              "usuario": nameController.text,
                            };
                            model.signUp(
                                userData: userData,
                                password: passwordController.text,
                                onSuccess: _sucesso,
                                onFail: _falha);
                          }
                        },
                      ),
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

  bool validarFormulario() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    }
    return false;
  }

  void _sucesso() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Cadastro realizado com sucesso!"),
    ));
  }

  void _falha(String e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(e),
    ));
  }
}
