import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:url_launcher/url_launcher.dart';

@Singleton(as: ShareService)
class ShareServiceImpl implements ShareService {
  final log = getLogger("Share Service Impl");
  @override
  launchUrl({String urlLink}) async {
    try {
      if (await canLaunch(urlLink)) {
        launch(urlLink);
      } else {
        //TODO Show cant can show url
      }
    } catch (e) {
      //TODO Error

    }
  }

  @override
  shareData({String title, String description, File file}) async {
    try {
      await Share.shareFiles([file.path],
          text: title + "\n\n" + description, subject: title);
    } catch (e) {
      log.e(e);
      //TODO show error
    }
  }
}
