import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/github_api_services.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view.dart';
import 'package:svuce_app/ui/widgets/gridmenu_item.dart';

final GithubApiServices _githubApiServices = GithubApiServices();

final NavigationService _navigationService = locator<NavigationService>();

List<SpotlightItem> libraryItems = [
  SpotlightItem(
      name: "Previous Papers", icon: FlutterIcons.library_mco, onTap: () {}),
  SpotlightItem(
      name: "Text Books", icon: FlutterIcons.library_mco, onTap: () {}),
  SpotlightItem(
      name: "Source Codes",
      icon: FlutterIcons.library_mco,
      onTap: () => _navigationService.navigateWithTransition(
          GithubPageView(
            url: _githubApiServices.programUrl,
            extensionUrl: _githubApiServices.rawGithubUrl,
          ),
          transition: "rightToLeftWithFade",
          duration: Duration(milliseconds: 900))),
  SpotlightItem(name: "Notes", icon: FlutterIcons.library_mco, onTap: () {})
];
