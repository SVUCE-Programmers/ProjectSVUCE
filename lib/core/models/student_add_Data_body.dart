// To parse this JSON data, do
//
//     final studentAddDataBody = studentAddDataBodyFromMap(jsonString);

import 'dart:convert';

StudentAddDataBody studentAddDataBodyFromMap(String str) =>
    StudentAddDataBody.fromMap(json.decode(str));

String studentAddDataBodyToMap(StudentAddDataBody data) =>
    json.encode(data.toMap());

class StudentAddDataBody {
  StudentAddDataBody({
    this.name,
    this.rollNo,
    this.gender,
    this.email,
    this.phoneNumber,
  });

  final String name;
  final int rollNo;
  final String gender;
  final String email;
  final int phoneNumber;

  StudentAddDataBody copyWith({
    String name,
    int rollNo,
    String gender,
    String email,
    int phoneNumber,
  }) =>
      StudentAddDataBody(
        name: name ?? this.name,
        rollNo: rollNo ?? this.rollNo,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory StudentAddDataBody.fromMap(Map<String, dynamic> json) =>
      StudentAddDataBody(
        name: json["Name"] == null ? null : json["Name"],
        rollNo: json["Roll No"] == null ? null : json["Roll No"],
        gender: json["Gender"] == null ? null : json["Gender"],
        email: json["Email"] == null ? null : json["Email"],
        phoneNumber: json["Phone Number"] == null ? null : json["Phone Number"],
      );

  Map<String, dynamic> toMap() => {
        "Name": name == null ? null : name,
        "Roll No": rollNo == null ? null : rollNo,
        "Gender": gender == null ? null : gender,
        "Email": email == null ? null : email,
        "Phone Number": phoneNumber == null ? null : phoneNumber,
      };
  static StudentAddDataBody getFromExcel(List<dynamic> data) {
    return StudentAddDataBody(
      name: data[0].value,
      rollNo: data[1].value.toInt(),
      gender: data[2].value,
      email: data[3].value,
      phoneNumber: data[4].value.toInt(),
    );
  }
}
