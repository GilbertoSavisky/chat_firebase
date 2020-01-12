import 'package:chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  //Firestore.instance.collection('mensagens').document('msg1').setData({'texto':'Ola'});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.greenAccent,
        ),
      ),
      home: ChatScreen(),
    );
  }
}