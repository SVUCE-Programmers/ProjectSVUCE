import 'package:svuce_app/hive_db/models/staff_model.dart';

abstract class StaffService {
  Future<Map<String, List<StaffModel>>> getStaffListFromApi();
  Future<Map<String, List<StaffModel>>> getStaffListFromHive();
  Future updateStaffDetailsToHive(String key ,List<StaffModel> staffModelList);
  Future<Map<String, List<StaffModel>>> getStaffData();
  Stream streamStaffData();
}
