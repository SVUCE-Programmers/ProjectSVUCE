import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/models/user.dart';

class FirestoreService {
  final CollectionReference _userColletionReference =
      Firestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      await _userColletionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userColletionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e?.message;
    }
  }

  Future isRollNoExists(String rollNo) async {
    try {
      var result = await _userColletionReference
          .where("rollNo", isEqualTo: rollNo)
          .getDocuments();

      if (result.documents != null) {
        return result.documents.isNotEmpty;
      }

      return false;
    } catch (e) {
      return e?.message;
    }
  }
}
