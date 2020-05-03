import 'package:auto_route/auto_route_annotations.dart';
import 'package:svuce_app/ui/views/home/home_view.dart';
import 'package:svuce_app/ui/views/startup/startup_view.dart';

@MaterialAutoRouter()
class $Router {
  StartUpView startUpViewRoute;
  HomeView homeViewRoute;
}
