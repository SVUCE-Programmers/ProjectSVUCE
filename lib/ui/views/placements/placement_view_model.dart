import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/hive_db/models/placement.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/hive_service.dart';

class PlacementViewModel extends BaseViewModel {
  final hiveService = locator<HiveService>();
  final apiService = locator<APIService>();
  final snackbarService = locator<SnackbarService>();

  List<String> branch = ["Chemical", "Civil", "EEE", "ECE", "Mech", "CSE"];
  List<Placement> _placementList;
  List<Placement> get placementList => _placementList;

  var url = "";
  getData() async {
    bool isExists = hiveService.isExists(boxName: "Placements");
    if (isExists) {
      setBusy(true);

      _placementList = await hiveService.getBoxes<Placement>("Placements");

      setBusy(false);
    } else {
      setBusy(true);

      try {
        var result = await apiService.fetchData(url: url);

        (result as List).map((item) {
          print(item);
          Placement ptitem = Placement();
          _placementList.add(ptitem);
        }).toList();

        await hiveService.addBoxes<Placement>(_placementList, "Placements");

        setBusy(false);
      } catch (e) {
        setBusy(false);
        return snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          icon: Icon(
            infoIcon,
            color: errorColor,
          ),
          backgroundColor: surfaceColor,
          title: commonErrorTitle,
          message: commonErrorInfo,
        );
      }
    }
  }
}
