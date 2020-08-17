import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'package:svuce_app/hive_db/models/staff.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';

class StaffViewModel extends BaseViewModel with SnackbarHelper {
  int length;
  List<Staff> _staffList = List<Staff>();
  List<Staff> get staffList => _staffList;

  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();

  final String url =
      "https://firebasestorage.googleapis.com/v0/b/svuce-52b0b.appspot.com/o/staff.json?alt=media&token=0abf1cf0-27b3-4702-89a8-362333c38235";

  getStaff() async {
    bool exists = await hiveService.isExists(boxName: "MainBox");

    if (exists) {
      // Getting data from Hive
      setBusy(true);

      _staffList = await hiveService.getBoxes<Staff>("MainBox");

      setBusy(false);
    } else {
      // Getting data from API and storing in hive for later usage
      setBusy(true);

      try {
        var result = await apiService.fetchData(url: url);

        (result as List).map((item) {
          print(item);
          Staff staffItem = Staff(
            avatar: item['avatar'],
            email: item['email'],
            fullName: item['fullName'],
          );
          _staffList.add(staffItem);
        }).toList();

        await hiveService.addBoxes<Staff>(_staffList, "MainBox");

        setBusy(false);
      } catch (e) {
        setBusy(false);
        showErrorMessage(
          title: commonErrorTitle,
          message: commonErrorInfo,
        );
      }
    }
  }
}
