import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getpet/firebase_options.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:getpet/Telas/Entrar.dart';
import 'package:getpet/models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: const Entrar(),
        ));
  }
}
