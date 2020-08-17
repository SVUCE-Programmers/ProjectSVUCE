import 'dart:io';

import 'package:flutter/material.dart';

import 'storage_result.dart';

abstract class CloudStorageService {
  Future<CloudStorageResult> uploadImage({@required File imageToUpload});
}
