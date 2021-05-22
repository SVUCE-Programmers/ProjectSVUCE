import 'dart:io';

import 'package:flutter/material.dart';

abstract class CloudStorageService {
  Future<String> uploadImage(
      {@required File imageToUpload,
      @required String fileName,
      @required String collectionName});
}
