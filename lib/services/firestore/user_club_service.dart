import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/user_club.dart';

class UserClubService {
  static Firestore _firestore = locator<Firestore>();

  static CollectionReference _userRef = _firestore.collection("users");

  final StreamController<List<UserClub>> _userClubStreamController =
      StreamController<List<UserClub>>.broadcast();

  Stream getUserClubs(String userId) {
    var query = _userRef.document(userId).collection("clubs");

    query.snapshots().listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var items = snapshot.documents
            .map((snapshot) => UserClub.fromSnapshot(snapshot))
            .toList();

        _userClubStreamController.add(items);
      }
    });

    return _userClubStreamController.stream;
  }

  Future addClubToUser(UserClub userClub, String userId) async {
    await _userRef
        .document(userId)
        .collection("clubs")
        .document(userClub.clubId)
        .setData(userClub.toJson());
  }
}
