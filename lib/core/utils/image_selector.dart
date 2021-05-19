import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelector {
  ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  File _image;
  pickImageFromCamera() async {
    _imageFile = await _picker.getImage(source: ImageSource.camera);
    if (_imageFile == null) return;
    _image = File(_imageFile.path);

    return _image;
  }

  pickImageFromGallery() async {
    _imageFile = await _picker.getImage(source: ImageSource.gallery);
    if (_imageFile == null) return;
    _image = File(_imageFile.path);

    return _image;
  }
}
