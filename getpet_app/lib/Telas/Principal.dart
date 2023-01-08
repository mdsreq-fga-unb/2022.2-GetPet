import 'package:flutter/material.dart';
import 'package:getpet/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model){
        return Scaffold(
          body: SafeArea(
            child: PageView(
              children: const <Widget>[
                //VerPerfil(),
                //VerChamados(),

              ],
            ),
          ),
        );
      }
    );
  }
}
