import 'dart:io';

import 'package:chat/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olã'),
        elevation: 0,
      ),
      body: TextComposer(
          _sendMessage
      ),
    );
  }


  }
  void _sendMessage({String texto, File imgFile}) async {
  if(imgFile != null) {
    StorageUploadTask task = FirebaseStorage.instance.ref().child(
      DateTime.now().millisecondsSinceEpoch.toString()).putFile(imgFile);
    StorageTaskSnapshot taskSnapshot = await task.onComplete;
    String url = await taskSnapshot.ref.getDownloadURL();
  }
  Firestore.instance.collection('menssages').add({
    'texto': texto
  });
}
