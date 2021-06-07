import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class ShareService {
  launchUrl({@required String urlLink});
  shareData({@required String title, @required String description, File file});
}
