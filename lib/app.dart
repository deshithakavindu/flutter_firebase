import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase/students_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Firebase.app();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Text(
                    "Firebase Initialized Successfully 🚀  $app",
                    style: TextStyle(color: Colors.black12),
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: FutureBuilder<List<QueryDocumentSnapshot>>(
                    future: StudentsDetails.getstudents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("No students found"));
                      } else {
                        final students = snapshot.data!;
                        return ListView.builder(
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data![index].data();
                            return Text("$data");
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
