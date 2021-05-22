import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'cloud_storage_service.dart';

@Singleton(as: CloudStorageService)
class CloudStorageServiceImpl implements CloudStorageService {
  @override
  Future<String> uploadImage(
      {@required File imageToUpload,
      @required String fileName,
      @required String collectionName}) async {
    try {
      Reference reference =
          FirebaseStorage.instance.ref("$collectionName").child(fileName);
      await reference.putFile(imageToUpload);
      print("Image Added");
      String imgUrl = await FirebaseStorage.instance
          .ref()
          .child('$collectionName/$fileName')
          .getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
