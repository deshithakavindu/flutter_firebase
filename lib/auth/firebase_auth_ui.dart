import 'package:demo_firebase/auth/auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

class FirebaseAuthUi extends StatelessWidget {
  const FirebaseAuthUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [
        EmailAuthProvider(),
        GoogleProvider(clientId: google_key),
        // FacebookProvider(clientId: 'YOUR_FACEBOOK_APP_ID'),
      ],
    );
  }
}

// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class FirebaseAuthUi extends StatelessWidget {
//   const FirebaseAuthUi({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SignInScreen(
//       providers: [EmailAuthProvider()],
//       subtitleBuilder: (context, action) {
//         return Text('sign in to continue');
//       },

//       headerBuilder: (context, constraints, shrinkoffset) {
//         return Center(child: Text('welcome to firebase auth'));
//       },

//       footerBuilder: (context, action) {
//         return TextButton(
//           onPressed: () {
//             if (action == AuthAction.signIn) {
//               Navigator.of(context).pushReplacementNamed('/register');
//             } else {
//               Navigator.of(context).pushReplacementNamed('/login');
//             }
//           },
//           child: Text(
//             action == AuthAction.signIn
//                 ? 'Don\'t have an account? Register'
//                 : 'Already have an account? Sign in',
//           ),
//         );
//       },

//       sideBuilder: (context, constraints) => const Center(
//         child: Text('side widget'),
//       ),
//     );
//   }
// }
