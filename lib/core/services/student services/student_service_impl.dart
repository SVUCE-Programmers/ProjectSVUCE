import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/student_add_Data_body.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/services/student%20services/student_service.dart';

@Singleton(as: StudentService)
class StudentServiceImpl extends StudentService {
  final CollectionReference _userCollection =
      locator<FirebaseFirestore>().collection("users");
  @override
  Future addStudentDataToFirebase(List<StudentAddDataBody> data) async {
    try {
      for (int i = 0; i < data.length; i++) {
        await _userCollection.doc(data[i].email).set(UserModel(
              fullName: data[i].name,
              email: data[i].email,
              rollNo: data[i].rollNo,
              userType: "STUDENT",
              phoneNumber: data[i].phoneNumber,
              collegeName: "SVUCE",
            ).toMap());
      }
      //! SHow that it is suucessdul
    } catch (e) {
      //! Show error
    }
  }
}
