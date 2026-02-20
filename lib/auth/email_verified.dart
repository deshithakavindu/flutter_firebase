import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo_firebase/keys.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
  }

  Future<void> checkEmailVerified() async {
    await user?.reload();
    if (!mounted) return;
    setState(() {
      isVerified = user?.emailVerified ?? false;
    });
    if (isVerified) {
      globalNavigatorKey.currentState?.pushReplacementNamed('/Realtimedata');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Email not verified yet.")));
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      await user?.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Verification email sent! Check your inbox."),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Email Verification")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Please verify your email address to continue.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: sendVerificationEmail,
                child: const Text("Resend Verification Email"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkEmailVerified,
                child: const Text("I have verified my email"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                  globalNavigatorKey.currentState?.pushReplacementNamed(
                    '/login',
                  );
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
