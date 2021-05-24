import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user/user.dart';

import 'users_repository.dart';

@Singleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  static FirebaseFirestore firestore = locator<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  static CollectionReference _userRef = firestore.collection("users");
  final StreamController<UserModel> _userController =
      StreamController<UserModel>.broadcast();

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

  @override
  void getUserDetailsFromPrefs() {
    if (_sharedPreferences.containsKey("id") &&
        _firebaseAuth.currentUser.uid == _sharedPreferences.getString("id")) {
      UserModel userModel = UserModel(
          fullName: _sharedPreferences.getString("fullName"),
          id: _sharedPreferences.getString("id"),
          email: _sharedPreferences.getString("email"),
          rollNo: _sharedPreferences.getString("rollNo"),
          bio: _sharedPreferences.getString("bio"),
          contact: _sharedPreferences.getString("contact"),
          collegeName: _sharedPreferences.getString("collegeName"),
          profileImg: _sharedPreferences.getString("profileImg"),
          userType: _sharedPreferences.getString("userType"));
      _userController.add(userModel);
    }
  }

  @override
  Stream getUserFromStream(String uid) {
    var data = _userRef.doc(uid).snapshots();
    data.listen((event) {
      UserModel userModel =
          UserModel.fromJson(Map<String, dynamic>.from(event.data()));
      _userController.add(userModel);
      addUserDetailsToPrefs(userModel);
    });
    return _userController.stream;
  }

  @override
  void addUserDetailsToPrefs(UserModel userModel) {
    if (userModel != null) {
      userModel.toJson().forEach((key, value) {
        _sharedPreferences.setString(key, value);
      });
    }
  }
}
