import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/githubApiResponse.dart';
import 'package:svuce_app/core/services/github_api_services.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view.dart';

import 'Resource Viewer/resource_viewer.dart';

class GithubPageViewModel extends BaseViewModel {
  final log = getLogger("Github Page ViewModel");
  List<GithubApiResponse> githubApiList = [];
  final ShareService _shareService = locator<ShareService>();
  String _extensionUrl;
  GithubApiServices _githubApiServices = GithubApiServices();

  init(String url, String extensionUrl) async {
    _extensionUrl = extensionUrl;
    setBusy(true);
    log.i(url);
    githubApiList = await _githubApiServices.getPrograms(url) ?? [];
    log.i(githubApiList.length);
    setBusy(false);

    notifyListeners();
  }

  final NavigationService _navigationService = locator<NavigationService>();

  //?Navigation Functions
  navigateBack() {
    _navigationService.back();
  }

  getUrl(GithubApiResponse githubApiResponse) {
    String url = _extensionUrl + "/${githubApiResponse.path}";
    return url;
  }

  navigationMode(GithubApiResponse githubApiResponse) async {
    if (githubApiResponse.type == "tree") {
      _navigationService.navigateWithTransition(
          GithubPageView(
            url: githubApiResponse.url,
            title: githubApiResponse.path,
            extensionUrl: _extensionUrl + "/${githubApiResponse.path}",
          ),
          transition: "fade",
          duration: Duration(milliseconds: 900));
    } else {
      log.d("Type is:${githubApiResponse.path.split(".").last}");
      _navigationService.navigateWithTransition(
          ResourceViewer(
            downloadFile: () => downloadFile(
                _extensionUrl + "/${githubApiResponse.path}",
                githubApiResponse.path),
            type: githubApiResponse.path.split(".").last,
            title: githubApiResponse.path,
            urlLink: _extensionUrl + "/${githubApiResponse.path}",
          ),
          transition: "fade",
          duration: Duration(milliseconds: 900));
    }
  }

  downloadFile(String url, String fileName) {
    log.wtf("URL IS:" + url);
    String extensions = "." + (url.split(".").last ?? 'txt');
    _shareService.downloadFile(url, fileName,
        extensionName: extensions,
        pathName: "/Svuce/${extensions.replaceAll(".", "")}/");
  }
}
