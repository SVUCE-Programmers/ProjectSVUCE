import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user_club/user_club.dart';
import 'package:svuce_app/core/repositories/user_clubs_repository/user_clubs_repository.dart';

@Singleton(as: UserClubsRepository)
class UserClubsRepositoryImpl implements UserClubsRepository {
  static Firestore firestore = locator<Firestore>();

  static CollectionReference _userRef = firestore.collection("users");

  final StreamController<List<UserClub>> _userClubStreamController =
      StreamController<List<UserClub>>.broadcast();

  @override
  Future addClubToUser(UserClub userClub, String userId) async {
    await _userRef
        .document(userId)
        .collection("clubs")
        .document(userClub.id)
        .setData(userClub.toJson());
  }

  @override
  Stream getUserClubs(String userId) {
    var query = _userRef.document(userId).collection("clubs");

    query.snapshots().listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var items = snapshot.documents
            .map((snapshot) => UserClub.fromDocument(snapshot))
            .toList();

        _userClubStreamController.add(items);
      }
    });

    return _userClubStreamController.stream;
  }
}
