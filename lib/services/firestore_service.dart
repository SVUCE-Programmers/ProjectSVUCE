import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/models/user.dart';

class FirestoreService {
  final CollectionReference _userColletionReference =
      Firestore.instance.collection("users");

  Future createUser(User user) async {
    //TODO: Check whether the rollno exists or not
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
      return e.message;
    }
  }
}
