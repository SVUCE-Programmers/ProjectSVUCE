import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/githubApiResponse.dart';
import 'package:svuce_app/core/services/github_api_services.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view.dart';
import 'package:svuce_app/ui/screens/github%20pages/resource_viewer.dart';

class GithubPageViewModel extends BaseViewModel {
  final log = getLogger("Github Page ViewModel");
  List<GithubApiResponse> githubApiList = [];
  String _extensionUrl;
  GithubApiServices _githubApiServices = GithubApiServices();

  init(String url, String extensionUrl) async {
    _extensionUrl = extensionUrl;
    setBusy(true);
    githubApiList = await _githubApiServices.getPrograms(url) ?? [];
    setBusy(false);

    notifyListeners();
  }

  final NavigationService _navigationService = locator<NavigationService>();

  //?Navigation Functions
  navigateBack() {
    _navigationService.back();
  }

  navigationMode(GithubApiResponse githubApiResponse) async {
    if (githubApiResponse.type == "tree") {
      _navigationService.navigateWithTransition(
          GithubPageView(
            url: githubApiResponse.url,
            extensionUrl: _extensionUrl + "/${githubApiResponse.path}",
          ),
          transition: "rightToLeftWithFade",
          duration: Duration(milliseconds: 900));
    } else {
      String data =
          await getRawContent(_extensionUrl + "/${githubApiResponse.path}");
      _navigationService.navigateWithTransition(ResourceViewer(data: data),
          transition: "rightToLeftWithFade",
          duration: Duration(milliseconds: 900));
      log.v(githubApiResponse.toMap());
    }
  }

  getRawContent(String url) async {
    setBusy(true);
    String data = await _githubApiServices.getContentFromRaw(url);
    setBusy(false);
    return data;
  }
}
