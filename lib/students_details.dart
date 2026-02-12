import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsDetails {
  static FirebaseFirestore instance = FirebaseFirestore.instance;
  static Future<List<QueryDocumentSnapshot>> getstudents() async {
    var students = await instance.collection('students').get();
    return students.docs;
  }
}
