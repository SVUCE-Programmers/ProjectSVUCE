import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user/user.dart';

import 'users_repository.dart';

@Singleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  static FirebaseFirestore firestore = locator<FirebaseFirestore>();

  static CollectionReference _userRef = firestore.collection("users");

  @override
  Future getUser(String userId) async {
    try {
      var userData = await _userRef.doc(userId).get();
      return UserModel.fromDocument(userData);
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }

  @override
  Future isRollNoExists(String rollNo) async {
    try {
      var result = await _userRef.where("rollNo", isEqualTo: rollNo).get();

      if (result.docs != null) {
        return result.docs.isNotEmpty;
      }

      return false;
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }

  @override
  Future storeUser(UserModel user) async {
    try {
      await _userRef.doc(user.id).set(user.toJson());
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }
}
