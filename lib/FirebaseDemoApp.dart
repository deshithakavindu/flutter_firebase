import 'package:demo_firebase/Routepage.dart';
import 'package:flutter/material.dart';

class Firebasedemoapp extends StatelessWidget {
  const Firebasedemoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Routepage(),
    );
  }
}
