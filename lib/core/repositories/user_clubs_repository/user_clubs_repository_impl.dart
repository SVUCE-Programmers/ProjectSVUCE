import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user_club/user_club.dart';
import 'package:svuce_app/core/repositories/user_clubs_repository/user_clubs_repository.dart';

@Singleton(as: UserClubsRepository)
class UserClubsRepositoryImpl implements UserClubsRepository {
  static FirebaseFirestore firestore = locator<FirebaseFirestore>();

  static CollectionReference _userRef = firestore.collection("users");

  final StreamController<List<UserClub>> _userClubStreamController =
      StreamController<List<UserClub>>.broadcast();

  @override
  Future addClubToUser(UserClub userClub, String userId) async {
    await _userRef
        .doc(userId)
        .collection("clubs")
        .doc(userClub.id)
        .set(userClub.toMap());
  }

  @override
  Stream getUserClubs(String userId) {
    var query = _userRef.doc(userId).collection("clubs");

    query.snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        var items = snapshot.docs
            .map((snapshot) =>
                UserClub.fromMap(Map<String, dynamic>.from(snapshot.data())))
            .toList();

        _userClubStreamController.add(items);
      }
    });

    return _userClubStreamController.stream;
  }
}
