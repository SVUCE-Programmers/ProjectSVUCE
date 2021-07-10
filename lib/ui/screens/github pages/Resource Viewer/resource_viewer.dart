import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/modal_hud.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/github%20pages/Resource%20Viewer/not_available.dart';
import 'package:svuce_app/ui/utils/highlight_view.dart';
import 'package:svuce_app/ui/widgets/pdf_viewer.dart';

import 'photo_viewer.dart';
import 'resource_viewer_view_model.dart';

class ResourceViewer extends StatelessWidget {
  final String urlLink;
  final String title;
  final String type;
  final Function downloadFile;

  const ResourceViewer(
      {Key key,
      @required this.urlLink,
      this.downloadFile,
      @required this.title,
      @required this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ResourceViewerViewModel>(
      showLoadingOnBusy: false,
      onModelReady: (m) => m.init(urlLink, type),
      viewModel: ResourceViewerViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: ModalHud(
          child: resourceViewer(urlLink, uiHelpers, model),
          isLoading: model.isBusy,
        ),
      ),
    );
  }

  Widget resourceViewer(
      String url, UiHelpers uiHelpers, ResourceViewerViewModel model) {
    switch (url.split(".").last) {
      case "jpg":
      case "jpeg":
      case "png":
      case "gif":
        return ImageViewerWidget(
          title: title,
          url: url,
          onBack: model.navigateBack,
        );
      case "pdf":
        return PdfViewerWidget(
          url: url,
        );
      case "py":
      case "java":
      case "c":
      case "cpp":
      case "js":
      case "jsx":
      case "css":
      case "html":
        return HightLightViewWidget(data: model.data, title: title);
      case "md":
        return model.data != null
            ? Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () => model.navigateBack(),
                      icon: Icon(backIcon, color: uiHelpers.textPrimaryColor)),
                ),
                body: MarkdownWidget(
                  physics: BouncingScrollPhysics(),
                  styleConfig: StyleConfig(
                      markdownTheme: !uiHelpers.isDark
                          ? MarkdownTheme.darkTheme
                          : MarkdownTheme.lightTheme,
                      olConfig: OlConfig(
                        textStyle: uiHelpers.body,
                        selectable: true,
                        indexWidget: (deep, index) => Container(
                          child: Text("${index + 1})  "),
                        ),
                      ),
                      ulConfig: UlConfig(
                        textStyle: uiHelpers.body,
                        selectable: true,
                        dotWidget: (deep, index) => Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 8, right: 12),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                        ),
                      ),
                      pConfig: PConfig(
                        delStyle: uiHelpers.body,
                        emStyle: uiHelpers.body,
                        textStyle: uiHelpers.body,
                        linkStyle: uiHelpers.body.copyWith(
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                        selectable: true,
                        onLinkTap: model.openUrl,
                      ),
                      blockQuoteConfig: BlockQuoteConfig(
                        leftSpace: 10,
                        backgroundColor: uiHelpers.surfaceColor,
                      ),
                      codeConfig: CodeConfig(
                          codeStyle: uiHelpers.title,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: uiHelpers.surfaceColor,
                              border:
                                  Border.all(color: uiHelpers.dividerColor))),
                      titleConfig: TitleConfig(
                          space: 12,
                          showDivider: true,
                          commonStyle: uiHelpers.title,
                          textConfig: TextConfig(textAlign: TextAlign.start),
                          h1: uiHelpers.headline,
                          h2: uiHelpers.headline.copyWith(fontSize: 24),
                          h3: uiHelpers.headline.copyWith(fontSize: 22),
                          h4: uiHelpers.headline.copyWith(fontSize: 20),
                          h5: uiHelpers.headline.copyWith(fontSize: 18),
                          h6: uiHelpers.headline.copyWith(fontSize: 16)),
                      hrConfig: HrConfig(color: uiHelpers.textPrimaryColor)),
                  data: model.data,
                  padding: const EdgeInsets.all(16.0),
                ),
              )
            : SizedBox();

      default:
        return NotAvailable(
          onBack: model.navigateBack,
          downloadFile: () => downloadFile(),
        );
    }
  }
}
