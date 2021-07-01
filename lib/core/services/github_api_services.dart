import 'dart:convert';

import 'package:http/http.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/core/models/githubApiResponse.dart';

class GithubApiServices {
  final log = getLogger("Github Api Services");
  final String programUrl =
      "https://api.github.com/repos/shashiben/RepoToTestGitApi/git/trees/6a50a2b1e7f22c9b0d45312eefc67df180975d58";
  final String rawGithubUrl =
      "https://raw.githubusercontent.com/shashiben/RepoToTestGitApi/master/Library";
  getPrograms(String url) async {
    List<GithubApiResponse> _githubApiResponse = [];
    log.v(url);
    try {
      var res = await get(Uri.parse(url));
      var data = (Map<String, dynamic>.from(jsonDecode(res.body))["tree"]);
      data.asMap().forEach((key, value) {
        _githubApiResponse.add(GithubApiResponse.fromMap(value));
      });
      log.d(_githubApiResponse);
      _githubApiResponse.asMap().forEach((key, value) {
        log.v(value.url);
      });
      return _githubApiResponse;
    } catch (e) {
      return null;
    }
  }

  String getRawGithubUrl({String userName, String repoName, String file}) {
    String url =
        "https://raw.githubusercontent.com/$userName/$repoName/master/$file";
    return url;
  }

  getContentFromRaw(String url) async {
    var res = await get(Uri.parse(url));
    var data = res.body.toString();
    return data;
  }
}
