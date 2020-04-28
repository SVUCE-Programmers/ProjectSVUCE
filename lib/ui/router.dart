import 'package:flutter/material.dart';
import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/ui/views/club_list_view.dart';
import 'package:svuce_app/ui/views/forgot_password_view.dart';
import 'package:svuce_app/ui/views/home_view.dart';
import 'package:svuce_app/ui/views/login_view.dart';
import 'package:svuce_app/ui/views/select_user.dart';
import 'package:svuce_app/ui/views/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      var isStudent = settings.arguments as bool;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(
          isStudent: isStudent,
        ),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case SelectUserViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SelectUserView(),
      );
    case ForgotPasswordViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ForgotPasswordView(),
      );
    case ClubListRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ClubListView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
