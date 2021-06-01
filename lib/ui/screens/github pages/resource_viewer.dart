import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view_model.dart';
import 'package:svuce_app/ui/widgets/pdf_viewer.dart';

class ResourceViewer extends StatelessWidget {
  final String data;
  final String urlLink;
  final String title;

  const ResourceViewer(
      {Key key,
      @required this.data,
      @required this.urlLink,
      @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<GithubPageViewModel>(
      viewModel: GithubPageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "${title.replaceAll("_", " ").split(".")[0]}",
              style: uiHelpers.headline,
            ),
            leading: IconButton(
                onPressed: () => model.navigateBack(),
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ))),
        body: resourceViewer(urlLink, uiHelpers),
      ),
    );
  }

  Widget resourceViewer(String url, UiHelpers uiHelpers) {
    switch (url.split(".").last) {
      case "pdf":
        return PdfViewerWidget(
          url: url,
        );
      case "md":
        return MarkdownWidget(
          physics: BouncingScrollPhysics(),
          styleConfig: StyleConfig(
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
                onLinkTap: (url) {
                  //TODO Add Url Launcher
                },
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
                      border: Border.all(color: uiHelpers.dividerColor))),
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
          data: data,
          padding: const EdgeInsets.all(16.0),
        );

      default:
        return SizedBox();
    }
  }
}
