import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<File> selectImage({ImageSource source}) async {
    return await ImagePicker.pickImage(source: source);
  }
}
