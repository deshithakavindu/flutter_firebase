import 'package:demo_firebase/app2.dart';
import 'package:demo_firebase/auth/email_verified.dart';
import 'package:demo_firebase/auth/login.dart';
import 'package:demo_firebase/auth/register.dart';
import 'package:demo_firebase/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Routepage extends StatefulWidget {
  const Routepage({super.key});

  @override
  State<Routepage> createState() => _RoutepageState();
}

class _RoutepageState extends State<Routepage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // Not logged in
        globalNavigatorKey.currentState?.pushReplacementNamed('/login');
      } else {
        // Logged in, check if email verified
        if (user.emailVerified) {
          globalNavigatorKey.currentState?.pushReplacementNamed(
            '/Realtimedata',
          );
        } else {
          globalNavigatorKey.currentState?.pushReplacementNamed('/verify');
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: globalNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/Realtimedata':
            return MaterialPageRoute(
              builder: (context) => const Realtimedata(),
            );
          case '/login':
            return MaterialPageRoute(builder: (context) => const Login());
          case '/register':
            return MaterialPageRoute(builder: (context) => const Register());
          case '/verify':
            return MaterialPageRoute(
              builder: (context) => const EmailVerificationPage(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) =>
                  const Scaffold(body: Center(child: Text("page not found"))),
            );
        }
      },
    );
  }
}
