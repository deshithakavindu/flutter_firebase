// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  String name;
  String city;

  Student({required this.name, required this.city});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(name: json['name'], city: json['city'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'city': city};
  }
}
