import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerUtil {
  pickExcelFile() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      return File(file.path);
    } else {
      // User canceled the picker
    }
  }
}
