import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/student_add_Data_body.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/services/student%20services/student_service.dart';
import 'package:svuce_app/ui/screens/main/consumers/imports.dart';

@Singleton(as: StudentService)
class StudentServiceImpl extends StudentService {
  final log = getLogger("Student Servicce Impl");
  final CollectionReference _userCollection =
      locator<FirebaseFirestore>().collection("users");
  final AuthService _authService = locator<AuthService>();
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

  final StreamController<List<UserModel>> _userStreamController =
      StreamController<List<UserModel>>.broadcast();
  @override
  Stream getStudentsByQuery(String text, bool isrollType) {
    List<UserModel> list = [];
    var data = _userCollection
        .where("${isrollType ? "rollNo" : "email"}",
            isEqualTo: isrollType ? int.parse(text) : text)
        .snapshots();
    data.listen((event) {
      list.clear();
      log.d(event);
      event.docs.asMap().forEach((key, value) {
        list.add(UserModel.fromMap(Map<String, dynamic>.from(value.data())));
      });
      _userStreamController.add(list);
    });

    return _userStreamController.stream;
  }

  @override
  Future<bool> deleteStudent(String id) async {
    if (_authService.hasAdminAccess) {
      try {
        await _userCollection.doc(id).delete();
        return true;
      } catch (e) {
        log.e(e);
        return false;
      }
    } else {
      showToast("You don't have access to perform this operation",
          backgroundColor: Colors.orangeAccent);
      return false;
    }
  }

  @override
  Future<bool> updateStudent(UserModel userModel) async {
    if (_authService.hasAdminAccess) {
      try {
        await _userCollection.doc(userModel.email).update(userModel.toMap());
        return true;
      } catch (e) {
        log.e(e);
        return false;
      }
    } else {
      showToast("You don't have access to perform this operation",
          backgroundColor: Colors.orangeAccent);
      return false;
    }
  }
}
