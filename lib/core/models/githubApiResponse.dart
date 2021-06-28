// To parse this JSON data, do
//
//     final githubApiResponse = githubApiResponseFromMap(jsonString);

import 'dart:convert';

GithubApiResponse githubApiResponseFromMap(String str) =>
    GithubApiResponse.fromMap(json.decode(str));

String githubApiResponseToMap(GithubApiResponse data) =>
    json.encode(data.toMap());

class GithubApiResponse {
  GithubApiResponse({
    this.path,
    this.mode,
    this.type,
    this.sha,
    this.url,
  });

  final String path;
  final String mode;
  final String type;
  final String sha;
  final String url;

  GithubApiResponse copyWith({
    String path,
    String mode,
    String type,
    String sha,
    String url,
  }) =>
      GithubApiResponse(
        path: path ?? this.path,
        mode: mode ?? this.mode,
        type: type ?? this.type,
        sha: sha ?? this.sha,
        url: url ?? this.url,
      );

  factory GithubApiResponse.fromMap(Map<String, dynamic> json) =>
      GithubApiResponse(
        path: json["path"] == null ? null : json["path"],
        mode: json["mode"] == null ? null : json["mode"],
        type: json["type"] == null ? null : json["type"],
        sha: json["sha"] == null ? null : json["sha"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toMap() => {
        "path": path == null ? null : path,
        "mode": mode == null ? null : mode,
        "type": type == null ? null : type,
        "sha": sha == null ? null : sha,
        "url": url == null ? null : url,
      };
}
