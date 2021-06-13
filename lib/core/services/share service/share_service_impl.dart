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

  @override
  initFlutterDownload() async {}

  @override
  Future downloadFile(String urlLink, String fileName) async {
    //TODO Add storage Permission

    Directory downloadsDirectory =
        await DownloadsPathProvider.downloadsDirectory;
    String path = downloadsDirectory.path;
    log.w(path);

    bool isDirExists = await Directory(path + "/Svuce").exists();
    log.i(isDirExists);
    if (isDirExists) {
    } else {
      Directory(path + "/Svuce").createSync(recursive: true);
    }
    bool granted = await Permission.storage.isGranted;
    log.w("Permission For STorage is:$granted");
    Dio dio = Dio();

    try {
      String filePath = downloadsDirectory.path +
          "/Svuce/" +
          fileName.replaceAll(" ", "") +
          ".png";
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
          payload: 'item x');
    }
  }
}
