import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/club/club.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'clubs_repository.dart';

@Singleton(as: ClubsRepository)
class ClubsRepositoryImpl implements ClubsRepository {
  static FirebaseFirestore firestore = locator<FirebaseFirestore>();

  static CollectionReference _clubsRef = firestore.collection("clubs");

  final StreamController<List<Club>> _clubStreamController =
      StreamController<List<Club>>.broadcast();

  @override
  Future followClub(String clubId, UserModel userModel) async {
    try {
      Map<String, dynamic> map = {
        "id": userModel.id,
        "name": userModel.fullName
      };
      await _clubsRef
          .doc(clubId)
          .collection("followers")
          .doc(userModel.id)
          .set(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Stream getClubs() {
    // Register the handler for when the posts data changes
    _clubsRef.snapshots().listen((snapshots) {
      if (snapshots.docs.isNotEmpty) {
        var posts = snapshots.docs
            .map((snapshot) => Club.fromMap(
                Map<String, dynamic>.from(snapshot.data()), snapshot.id))
            .toList();

        // Add the [items] onto the controller
        _clubStreamController.add(posts);
      }
    });

    return _clubStreamController.stream;
  }
}
