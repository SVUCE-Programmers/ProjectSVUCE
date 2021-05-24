import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/utils/file_picker.dart';

class AddStudentViewModel extends BaseViewModel {
  final log = getLogger("Add Student View Model");
  final NavigationService _navigationService = locator<NavigationService>();
  final FilePickerUtil _filePickerUtil = FilePickerUtil();

  init() {}

  pickExcel() async {
    var data = await _filePickerUtil.pickExcelFile();
    log.i("Result From File Picker is:$data");
  }

  //?Navigation Services
  navigateBack() {
    _navigationService.back();
  }
}
