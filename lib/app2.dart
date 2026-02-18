import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase/models/student.dart';
import 'package:demo_firebase/students_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Realtimedata extends StatefulWidget {
  const Realtimedata({super.key});

  @override
  State<Realtimedata> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Realtimedata> {
  late final Stream<QuerySnapshot<Student>> studentStream;

  // @override
  // void initState() {
  //   StudentsDetails.addstudents(Student(name: "hope", city: "west indies"));
  //   super.initState();
  // }

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
                  child: StreamBuilder(
                    stream: StudentsDetails.getstudentbycity('afganisthan'),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (!snapshot.hasData ||
                          snapshot.data!.docs.isEmpty) {
                        return Center(child: Text("No students found"));
                      } else {
                        final students = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            var student2 = students[index];
                            var student = student2.data();
                            // print(
                            //   "type of student: ${student.runtimeType}",
                            // ); // should print: Student

                            return GestureDetector(
                              onTap: () async {
                                var stu = await StudentsDetails.getstudentsbyid(
                                  student2.id,
                                );
                                print({"tapped on ${stu?.name}"});
                              },
                              child: ListTile(
                                title: Text(student.name),
                                subtitle: Text(student.city),
                              ),
                            );
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
