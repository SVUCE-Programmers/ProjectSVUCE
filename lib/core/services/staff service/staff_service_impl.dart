import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/configs.dart';
import 'package:svuce_app/hive_db/models/staff_model.dart';
import 'package:svuce_app/core/services/staff%20service/staff_service.dart';

@Singleton(as: StaffService)
class StaffServiceImpl implements StaffService {
  final StreamController<Map<String, List<StaffModel>>> staffDataController =
      StreamController<Map<String, List<StaffModel>>>.broadcast();
  final log = getLogger("Staff Service");
  @override
  Future<Map<String, List<StaffModel>>> getStaffListFromApi() async {
    Map<String, List<StaffModel>> dataToSend = {};

    var res = await get(Uri.parse("${UrlConfigs.staffJsonUrl}"));
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      if (!Hive.box("Staff").isOpen) await Hive.openBox("Staff");
      data.forEach((key, value) async {
        List<StaffModel> staffModelList = [];
        value.asMap().forEach((subKey, subValue) {
          staffModelList.add(StaffModel.fromMap(subValue));
        });
        dataToSend[key] = staffModelList;
        await updateStaffDetailsToHive(key, staffModelList);
        log.v("List is:$staffModelList");
      });
      staffDataController.add(dataToSend);
    }
    return dataToSend;
  }

  @override
  Future<Map<String, List<StaffModel>>> getStaffListFromHive() async {
    Map<String, List<StaffModel>> data = {};
    if (!Hive.isBoxOpen("Staff")) {
      await Hive.openBox("Staff");
    }

    var box = Hive.box("Staff");
    int boxLength = Hive.box("Staff").length;
    log.d("Box Length is:$boxLength");
    for (int i = 0; i < boxLength; i++) {
      String key = await box.keys.elementAt(i);
      List<dynamic> list = (await Hive.box("Staff").values.elementAt(i));
      List<StaffModel> staffList = [];
      list.asMap().forEach((key, value) {
        staffList.add(value);
      });
      data[key] = staffList;
    }
    staffDataController.add(data);
    getStaffListFromApi();
    return data;
  }

  @override
  Future updateStaffDetailsToHive(
      String key, List<StaffModel> staffModelList) async {
    await Hive.box("Staff").put('$key', staffModelList);
  }

  @override
  Future<Map<String, List<StaffModel>>> getStaffData() async {
    Map<String, List<StaffModel>> data = {};
    if (!Hive.isBoxOpen("Staff")) {
      await Hive.openBox("Staff");
    }
    var box = Hive.box("Staff");
    if (box.isEmpty) {
      data = await getStaffListFromApi();
    } else {
      data = await getStaffListFromHive();
    }
    return data;
  }

  @override
  Stream streamStaffData() {
    getStaffListFromHive();
    return staffDataController.stream;
  }
}
