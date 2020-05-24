import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveService {
  isExists({String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }

  getBoxes<T>(String boxName) async {
    List<T> boxList = List<T>();

    final openBox = await Hive.openBox(boxName);

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }

  getBoxAtIndex<T>(String boxName, int index) async {
    int length = Hive.box(boxName).length;

    if (index >= length) {
      return "INDEX_ERROR";
    }

    final openBox = await Hive.openBox(boxName);

    var result = openBox.getAt(index);

    return result as T;
  }

  updateBoxAtIndex<T>(String boxName, var newBox, int oldBoxIndex) async {
    int length = Hive.box(boxName).length;

    if (oldBoxIndex >= length) {
      return "INDEX_ERROR";
    }

    newBox = newBox as T;

    final openBox = await Hive.openBox(boxName);

    await openBox.putAt(oldBoxIndex, newBox);
  }
}
