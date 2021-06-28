import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'package:svuce_app/core/services/staff%20service/staff_service.dart';
import 'package:svuce_app/hive_db/models/staff_model.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';

class StaffViewModel extends BaseViewModel with SnackbarHelper {
  final log = getLogger("Staff View Model");
  int length;
  Map<String, List<StaffModel>> _staffList = {};
  Map<String, List<StaffModel>> get staffList => _staffList;

  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final StaffService _staffService = locator<StaffService>();

  getStaff() async {
    setBusy(true);
    _staffService.streamStaffData().listen((event) {
      _staffList = event;
      setBusy(false);
    });
  }
  // getStaff() async {
  //   bool exists = await hiveService.isExists(boxName: "MainBox");

  //   if (exists) {
  //     // Getting data from Hive
  //     setBusy(true);

  //     _staffList = await hiveService.getBoxes<Staff>("MainBox");

  //     setBusy(false);
  //   } else {
  //     // Getting data from API and storing in hive for later usage
  //     setBusy(true);

  //     try {
  //       var result = await apiService.fetchData(url: url);

  //       (result as List).map((item) {
  //         print(item);
  //         Staff staffItem = Staff(
  //           avatar: item['avatar'],
  //           email: item['email'],
  //           fullName: item['fullName'],
  //         );
  //         _staffList.add(staffItem);
  //       }).toList();

  //       await hiveService.addBoxes<Staff>(_staffList, "MainBox");

  //       setBusy(false);
  //     } catch (e) {
  //       setBusy(false);
  //       showErrorMessage(
  //         title: commonErrorTitle,
  //         message: commonErrorInfo,
  //       );
  //     }
  //   }
  // }

  goBack() {
    _navigationService.back();
  }
}
