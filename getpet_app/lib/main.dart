import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/client_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ClientModel>(
        model: ClientModel(),
        child: MaterialApp(
          title: 'GetPet App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
