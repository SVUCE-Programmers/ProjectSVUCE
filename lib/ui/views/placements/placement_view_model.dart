import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'package:svuce_app/hive_db/models/placement.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/core/models/graph.dart';
import 'package:svuce_app/ui/views/action_center/dataset.dart';

class PlacementViewModel extends BaseViewModel {
  final hiveService = locator<HiveService>();
  final apiService = locator<APIService>();
  final snackbarService = locator<SnackbarService>();

  List<Placement> _placementList = [];
  List<Placement> get placementList => _placementList;

  List<String> _yearList = [];
  List<String> get yearList => _yearList;

  List<double> _placementno = [];
  List<double> get placementno => _placementno;

  var url =
      "https://firebasestorage.googleapis.com/v0/b/svuce-52b0b.appspot.com/o/placement.json?alt=media&token=84207908-91c4-4c12-a858-c8cf81744b9a";

  getGraph() {
    DataSet dataSet = DataSet(placementno);
    Graph graph = Graph([dataSet], "", "%");
    graph.domainStart = 0;
    graph.domainEnd = 4;
    graph.rangeStart = 0;
    graph.rangeEnd = 30;
    graph.selectedDataPoint = 1;
    return graph;
  }

  getData() async {
    bool exist = await hiveService.isExists(boxName: "Placements");
    if (exist) {
      setBusy(true);
      _placementList = await hiveService.getBoxes<Placement>("Placements");
      for (var i in _placementList) {
        _yearList.add(i.year);
        _placementno.add((i.no / 100).toDouble());
      }
      setBusy(false);
    } else {
      try {
        setBusy(true);
        var result = await apiService.fetchData(url: url);
        (result as List).map((item) {
          Placement ptitem = Placement(year: item["year"], no: item["no"]);
          _placementList.add(ptitem);
          _placementno.add((ptitem.no / 100).toDouble());
          _yearList.add(ptitem.year);
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
          message: e.toString(),
        );
      }
    }
    getGraph();
  }
}
