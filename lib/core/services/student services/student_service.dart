import 'package:svuce_app/core/models/student_add_Data_body.dart';

abstract class StudentService {
  Future addStudentDataToFirebase(List<StudentAddDataBody> data);
}
