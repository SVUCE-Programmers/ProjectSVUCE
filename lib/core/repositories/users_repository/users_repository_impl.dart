import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/models/user/user.dart';

import 'users_repository.dart';

@Singleton(as: UsersRepository)
class UsersRepositoryImpl with SnackbarHelper implements UsersRepository {
  final log = getLogger("UsersRepositoryImpl");
  static FirebaseFirestore firestore = locator<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  static CollectionReference _userRef = firestore.collection("users");
  final StreamController<UserModel> _userController =
      StreamController<UserModel>.broadcast();

  @override
  Future getUser(String email) async {
    try {
      var userData = await _userRef.where("email", isEqualTo: email).get();
      log.d("Got data at getUser is:${userData.docs[0].data()}");
      if (Map<String, dynamic>.from(userData.docs[0].data())["id"] != null) {
        return UserModel.fromMap(
            Map<String, dynamic>.from(userData.docs[0].data()));
      } else {
        var data = Map<String, dynamic>.from(userData.docs[0].data());
        return UserModel(
          id: _firebaseAuth.currentUser.uid,
          collegeName: data["collegeName"],
          rollNo: data["rollNo"],
          userType: data["userType"],
          contact: data["contact"],
          fullName: data["fullName"],
          email: email,
        );
      }
    } catch (e) {
      log.e("e");
      return e ?? "Something went wrong";
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
      await _userRef.doc(user.email).set(user.toMap());
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
          contact: _sharedPreferences.getString("contact"),
          collegeName: _sharedPreferences.getString("collegeName"),
          profileImg: _sharedPreferences.getString("profileImg"),
          userType: _sharedPreferences.getString("userType"));
      _userController.add(userModel);
    }
  }

  @override
  Stream getUserFromStream(String email) {
    var data = _userRef.doc(email).snapshots();
    data.listen((event) {
      UserModel userModel =
          UserModel.fromMap(Map<String, dynamic>.from(event.data()));
      _userController.add(userModel);
      addUserDetailsToPrefs(userModel);
    });
    return _userController.stream;
  }

  @override
  void addUserDetailsToPrefs(UserModel userModel) {
    if (userModel != null) {
      userModel.toMap().forEach((key, value) {
        log.d("Key is:$key and value is:$value");
        if (value != null) {
          _sharedPreferences.setString(key, value ?? "");
        }
      });
    }
  }

  @override
  Future signupUser(String email) async {
    try {
      var data = await _userRef.doc(email).get();
      if (data != null && data.data() != null) {
        if (Map<String, dynamic>.from(data.data())["id"] != null) {
          showInfoMessage(
            title: commonErrorTitle,
            message: "Your account already exists, try logging in",
          );
          return false;
        } else {
          return true;
        }
      } else {
        return false;
        //TODO Show User is Not Found in Database
      }
    } catch (e) {
      showInfoMessage(
        title: commonErrorTitle,
        message: "$e",
      );
      return false;
    }
  }

  @override
  Future updateUser(Map<String, dynamic> userData) async {
    try {
      log.d(userData);
      await _userRef.doc(userData["email"]).update(userData);
    } catch (e) {
      return e ?? "Something went wrong";
    }
  }
}
