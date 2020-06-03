import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/models/club/club.dart';

class ClubsService {
  final Firestore firestore;

  final CollectionReference _clubsRef;

  final StreamController<List<Club>> _clubStreamController =
      StreamController<List<Club>>.broadcast();

  ClubsService(this.firestore) : this._clubsRef = firestore.collection("clubs");

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
}
