import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CloudStorageService {
  Future<CloudStorageResult> uploadImage({@required File imageToUpload}) async {
    // random value to use it as file name
    var imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Get the reference to the file where we want to upload
    final StorageReference reference =
        FirebaseStorage.instance.ref().child(imageFileName);

    StorageUploadTask uploadTask = reference.putFile(imageToUpload);

    StorageTaskSnapshot snapshot = await uploadTask.onComplete;

    var downloadUrl = await snapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      return CloudStorageResult(imageUrl: url, imageFileName: imageFileName);
    }

    return null;
  }
}

class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;

  CloudStorageResult({this.imageUrl, this.imageFileName});
}
