import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/club/club.dart';
import 'clubs_repository.dart';

@Singleton(as: ClubsRepository)
class ClubsRepositoryImpl implements ClubsRepository {
  static Firestore firestore = locator<Firestore>();

  static CollectionReference _clubsRef = firestore.collection("clubs");

  final StreamController<List<Club>> _clubStreamController =
      StreamController<List<Club>>.broadcast();

  @override
  Future followClub(String clubId, String userId) async {
    try {
      Map<String, dynamic> map = {"id": userId};

      await _clubsRef
          .document(clubId)
          .collection("followers")
          .document(userId)
          .setData(map);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Stream getClubs() {
    // Register the handler for when the posts data changes
    _clubsRef.snapshots().listen((snapshots) {
      if (snapshots.documents.isNotEmpty) {
        var posts = snapshots.documents
            .map((snapshot) => Club.fromDocument(snapshot))
            .toList();

        // Add the [items] onto the controller
        _clubStreamController.add(posts);
      }
    });

    return _clubStreamController.stream;
  }
}
