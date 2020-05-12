import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/app/theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:svuce_app/models/staff.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir=await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(StaffAdapter());
  
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVUCE App',
      theme: themeData,
      initialRoute: Routes.startUpViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
