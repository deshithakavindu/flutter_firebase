import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase/app.dart';
import 'package:demo_firebase/app2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Realtimedata());
}
