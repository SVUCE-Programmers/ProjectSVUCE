import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';

@lazySingleton
class HiveService {
  final _hiveInterface = locator<HiveInterface>();
  final log = getLogger("Hive Service");

  isExists({String boxName}) async {
    final openBox = await _hiveInterface.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  deleteItem<T>({String boxName, T item}) async {
    List<T> boxList = [];
    boxList = await getBoxes<T>(boxName);
    int index;
    boxList.asMap().forEach((key, value) {
      if (value == item) {
        index = key;
      }
    });
    if (index != null) {
      _hiveInterface.box(boxName).deleteAt(index);
    }
  }

  clearItemsInBox(String boxName) async {
    await _hiveInterface.box(boxName).clear();
  }

  addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await _hiveInterface.openBox(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }

  getBoxes<T>(String boxName) async {
    List<T> boxList = [];

    final openBox = await _hiveInterface.openBox(boxName);

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }

  getBoxAtIndex<T>(String boxName, int index) async {
    int length = _hiveInterface.box(boxName).length;
    if (index >= length) {
      return "INDEX_ERROR";
    }
    final openBox = Hive.box(boxName).isOpen
        ? _hiveInterface.box<T>(boxName)
        : await _hiveInterface.openBox<T>(boxName);
    var result = openBox.getAt(index);
    print(result.runtimeType);
    return result;
  }

  updateBoxAtIndex<T>(String boxName, var newBox, int oldBoxIndex) async {
    int length = _hiveInterface.box(boxName).length;

    if (oldBoxIndex >= length) {
      return "INDEX_ERROR";
    }

    newBox = newBox as T;

    final openBox = await _hiveInterface.openBox(boxName);

    await openBox.putAt(oldBoxIndex, newBox);
  }
}
