import 'package:injectable/injectable.dart';
import 'package:svuce_app/core/models/student_add_Data_body.dart';

@lazySingleton
abstract class StudentService {
  Future addStudentDataToFirebase(List<StudentAddDataBody> data);
  Stream getStudentsByQuery(String text, bool isRollType);
  Future<bool> deleteStudent(String id);
}
