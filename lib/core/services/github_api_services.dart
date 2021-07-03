import 'dart:convert';

import 'package:http/http.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/core/models/githubApiResponse.dart';

class GithubApiServices {
  final log = getLogger("Github Api Services");
  final String programUrl =
      "https://api.github.com/repos/SVUCE-Programmers/E-Library/git/trees/master";
  final String rawGithubUrl =
      "https://raw.githubusercontent.com/SVUCE-Programmers/E-Library/master";
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
