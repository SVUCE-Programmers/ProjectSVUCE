import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  requestStoragePermission() async {
    if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
    } else {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        await Permission.storage.request();
        var status = await Permission.storage.status;
        if (status.isGranted) {
          return true;
        } else {
          return false;
        }
      } else if (status.isGranted) {
        return true;
      }
    }
  }
}
