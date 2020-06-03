import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/models/user/user.dart';

class UserService {
  final Firestore firestore;

  final CollectionReference _userRef;

  UserService(this.firestore) : this._userRef = firestore.collection("users");

  Future storeUser(User user) async {
    try {
      await _userRef.document(user.id).setData(user.toJson());
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }

  Future getUser(String userId) async {
    try {
      var userData = await _userRef.document(userId).get();
      return User.fromDocument(userData);
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }

  Future isRollNoExists(String rollNo) async {
    try {
      var result =
          await _userRef.where("rollNo", isEqualTo: rollNo).getDocuments();

      if (result.documents != null) {
        return result.documents.isNotEmpty;
      }

      return false;
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }
}
