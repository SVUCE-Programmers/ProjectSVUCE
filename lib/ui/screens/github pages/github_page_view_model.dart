import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/githubApiResponse.dart';
import 'package:svuce_app/core/services/github_api_services.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view.dart';

import 'Resource Viewer/resource_viewer.dart';

class GithubPageViewModel extends BaseViewModel {
  static final Map<String, IconData> mimeTypeToIconDataMap = <String, IconData>{
    'image': FontAwesome.image,
    'application/pdf': FontAwesome.file_pdf_o,
    'application/msword': FontAwesome.file_word_o,
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
        FontAwesome.file_word_o,
    'application/vnd.oasis.opendocument.text': FontAwesome.file_word_o,
    'application/vnd.ms-excel': FontAwesome.file_excel_o,
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
        FontAwesome.file_excel_o,
    'application/vnd.oasis.opendocument.spreadsheet': FontAwesome.file_excel_o,
    'application/vnd.ms-powerpoint': FontAwesome.file_powerpoint_o,
    'application/vnd.openxmlformats-officedocument.presentationml.presentation':
        FontAwesome.file_powerpoint_o,
    'application/vnd.oasis.opendocument.presentation':
        FontAwesome.file_powerpoint_o,
    'text/plain': FontAwesome.file_text,
    'text/csv': FontAwesome.file_excel_o,
    'application/x-archive': FontAwesome.file_archive_o,
    'application/x-cpio': FontAwesome.file_archive_o,
    'application/x-shar': FontAwesome.file_archive_o,
    'application/x-iso9660-image': FontAwesome.file_archive_o,
    'application/x-sbx': FontAwesome.file_archive_o,
    'application/x-tar': FontAwesome.file_archive_o,
    'application/x-bzip2': FontAwesome.file_archive_o,
    'application/gzip': FontAwesome.file_archive_o,
    'application/x-lzip': FontAwesome.file_archive_o,
    'application/x-lzma': FontAwesome.file_archive_o,
    'application/x-lzop': FontAwesome.file_archive_o,
    'application/x-snappy-framed': FontAwesome.file_archive_o,
    'application/x-xz': FontAwesome.file_archive_o,
    'application/x-compress': FontAwesome.file_archive_o,
    'application/zstd': FontAwesome.file_archive_o,
    'application/java-archive': FontAwesome.file_archive_o,
    'application/octet-stream': FontAwesome.file_archive_o,
    'application/vnd.android.package-archive': FontAwesome.file_archive_o,
    'application/vnd.ms-cab-compressed': FontAwesome.file_archive_o,
    'application/x-7z-compressed': FontAwesome.file_archive_o,
    'application/x-ace-compressed': FontAwesome.file_archive_o,
    'application/x-alz-compressed': FontAwesome.file_archive_o,
    'application/x-apple-diskimage': FontAwesome.file_archive_o,
    'application/x-arj': FontAwesome.file_archive_o,
    'application/x-astrotite-afa': FontAwesome.file_archive_o,
    'application/x-b1': FontAwesome.file_archive_o,
    'application/x-cfs-compressed': FontAwesome.file_archive_o,
    'application/x-dar': FontAwesome.file_archive_o,
    'application/x-dgc-compressed': FontAwesome.file_archive_o,
    'application/x-freearc': FontAwesome.file_archive_o,
    'application/x-gca-compressed': FontAwesome.file_archive_o,
    'application/x-gtar': FontAwesome.file_archive_o,
    'application/x-lzh': FontAwesome.file_archive_o,
    'application/x-lzx': FontAwesome.file_archive_o,
    'application/x-ms-wim': FontAwesome.file_archive_o,
    'application/x-rar-compressed': FontAwesome.file_archive_o,
    'application/x-stuffit': FontAwesome.file_archive_o,
    'application/x-stuffitx': FontAwesome.file_archive_o,
    'application/x-xar': FontAwesome.file_archive_o,
    'application/x-zoo': FontAwesome.file_archive_o,
    'application/zip': FontAwesome.file_archive_o,
    'text/html': FontAwesome.code,
    'text/javascript': FontAwesome.code,
    'text/css': FontAwesome.code,
    'text/x-python': FontAwesome.code,
    'application/x-python-code': FontAwesome.code,
    'text/xml': FontAwesome.code,
    'application/xml': FontAwesome.code,
    'text/x-c': FontAwesome.code,
    'application/java': FontAwesome.code,
    'application/java-byte-code': FontAwesome.code,
    'application/x-java-class': FontAwesome.code,
    'application/x-csh': FontAwesome.code,
    'text/x-script.csh': FontAwesome.code,
    'text/x-fortran': FontAwesome.code,
    'text/x-h': FontAwesome.code,
    'application/x-ksh': FontAwesome.code,
    'text/x-script.ksh': FontAwesome.code,
    'application/x-latex': FontAwesome.code,
    'application/x-lisp': FontAwesome.code,
    'text/x-script.lisp': FontAwesome.code,
    'text/x-m': FontAwesome.code,
    'text/x-pascal': FontAwesome.code,
    'text/x-script.perl': FontAwesome.code,
    'application/postscript': FontAwesome.code,
    'text/x-script.phyton': FontAwesome.code,
    'application/x-bytecode.python': FontAwesome.code,
    'text/x-asm': FontAwesome.code,
    'application/x-bsh': FontAwesome.code,
    'application/x-sh': FontAwesome.code,
    'text/x-script.sh': FontAwesome.code,
    'text/x-script.zsh': FontAwesome.code,
    'default': FontAwesome.file,
  };
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
            title: githubApiResponse.path,
            extensionUrl: _extensionUrl + "/${githubApiResponse.path}",
          ),
          transition: "fade",
          duration: Duration(milliseconds: 900));
    } else {
      _navigationService.navigateWithTransition(
          ResourceViewer(
            title: githubApiResponse.path,
            urlLink: _extensionUrl + "/${githubApiResponse.path}",
          ),
          transition: "fade",
          duration: Duration(milliseconds: 900));
      log.v(githubApiResponse.toMap());
    }
  }
}
