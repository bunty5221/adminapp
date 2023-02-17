import 'package:adminapp/view/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  if (kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(

            apiKey: "AIzaSyBIu45oe8LBE0e1nkaD0n3ffHxNf8Lay3k",
            appId: "1:563622116007:web:56efcda2a20dd69a8eb982",
            messagingSenderId: "563622116007",
            projectId: "sportsapp-32ae3")


    );

  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportsPitcher',
      theme: ThemeData(
        primarySwatch: Colors.purple,

      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
