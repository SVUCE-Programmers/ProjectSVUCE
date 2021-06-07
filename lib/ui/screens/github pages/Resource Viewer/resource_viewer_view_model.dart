import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/github_api_services.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';

class ResourceViewerViewModel extends BaseViewModel {
  String _urlLink;
  String data;
  GithubApiServices _githubApiServices = GithubApiServices();
  final ShareService _shareService = locator<ShareService>();

  init(String urlLink) {
    _urlLink = urlLink;
    getDataFromUrl();
    notifyListeners();
  }

  openUrl(String urlLink) => _shareService.launchUrl(urlLink: urlLink);

  getDataFromUrl() async {
    data = await getRawContent(_urlLink);
  }

  getRawContent(String url) async {
    setBusy(true);
    String data = await _githubApiServices.getContentFromRaw(url);
    setBusy(false);
    return data;
  }

  final NavigationService _navigationService = locator<NavigationService>();

  //?Navigation Functions
  navigateBack() {
    _navigationService.back();
  }
}
