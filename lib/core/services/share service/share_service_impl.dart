import 'dart:io';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:url_launcher/url_launcher.dart';

@Singleton(as: ShareService)
class ShareServiceImpl implements ShareService {
  final log = getLogger("Share Service Impl");
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  launchUrl({String urlLink}) async {
    try {
      if (await canLaunch(urlLink)) {
        launch(urlLink);
      } else {
        //TODO Show cant can show url
      }
    } catch (e) {
      //  TODO Show ertror

    }
  }

  @override
  shareData({String title, String description, File file}) async {
    try {
      if (file != null) {
        await Share.shareFiles([file.path],
            text: title + "\n\n" + description, subject: title);
      } else {
        await Share.share(title + "\n\n" + description, subject: title);
      }
    } catch (e) {
      log.e(e);
      //TODO show error
    }
  }

  @override
  initFlutterDownload() async {}

  @override
  Future downloadFile(String urlLink, String fileName,
      {String pathName, String extensionName}) async {
    //TODO Add storage Permission
    bool granted = await Permission.storage.isGranted;
    if (!granted) {
      await Permission.storage.request();
    }
    granted = await Permission.storage.isGranted;
    if (granted) {
      log.w("Permission For STorage is:$granted");
      Directory downloadsDirectory =
          await DownloadsPathProvider.downloadsDirectory;
      String path = downloadsDirectory.path;
      log.w(path);

      bool isDirExists = await Directory(path + pathName).exists();
      log.i(isDirExists);
      if (!isDirExists) {
        Directory(path + pathName).createSync(recursive: true);
      }
      Dio dio = Dio();
      try {
        String filePath =
            path + pathName + fileName.replaceAll(" ", "") + extensionName;
        log.wtf(filePath);
        await dio.download(
          urlLink,
          filePath,
          onReceiveProgress: (value, total) {
            if (total != -1) {
              showNotificationWIthValue(value, total, filename: fileName);
            }
          },
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }),
        );
      } catch (e) {
        print(e);
      }
    } else {
      //TODO show No Permission
    }
  }

  showNotificationWIthValue(int value, int maxProgress,
      {@required String filename}) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            '$filename', 'Download Channel', 'File Downloading Channel',
            channelShowBadge: false,
            importance: Importance.max,
            priority: Priority.high,
            onlyAlertOnce: true,
            icon: "@mipmap/ic_launcher",
            showProgress: true,
            maxProgress: maxProgress,
            progress: value);
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    var initializationSettingsAndroid = AndroidInitializationSettings(
        '@mipmap/ic_launcher'); // <- default icon name is @mipmap/ic_launcher
    var initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: (a, b, c, d) {
      return;
    });
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (onSelect) {
      return;
    });
    if (value == maxProgress) {
      await flutterLocalNotificationsPlugin.show(
          0, '$filename', 'Download Completed', platformChannelSpecifics,
          payload: 'item x');
    } else {
      await flutterLocalNotificationsPlugin.show(
        0,
        '$filename',
        '${((value / maxProgress) * 100).toInt()}% Completed',
        platformChannelSpecifics,
        payload: 'item x',
      );
    }
  }
}
