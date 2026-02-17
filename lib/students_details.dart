import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase/models/student.dart';

class StudentsDetails {
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static Future<List<QueryDocumentSnapshot<Student>>> getstudents() async {
    var students = await instance
        .collection('students')
        .withConverter(
          fromFirestore: (snapshot, _) => Student.fromJson(snapshot.data()!),
          toFirestore: (student, _) => student.toJson(),
        )
        .get();
    return students.docs;
  }

  static getstudentstream() {
    return instance
        .collection('students')
        .withConverter(
          fromFirestore: (snapshot, _) => Student.fromJson(snapshot.data()!),
          toFirestore: (student, _) => student.toJson(),
        )
        .snapshots();
  }

  static addstudents(Student student) async {
    await instance.collection('students').add(student.toJson());
  }
}
