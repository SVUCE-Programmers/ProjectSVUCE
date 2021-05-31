import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view_model.dart';

class GithubPageView extends StatelessWidget {
  final String url;
  final String extensionUrl;

  const GithubPageView(
      {Key key, @required this.url, @required this.extensionUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<GithubPageViewModel>(
      onModelReady: (m) => m.init(url, extensionUrl),
      viewModel: GithubPageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                model.isBusy
                    ? SizedBox()
                    : ListView.builder(
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                  trailing: Icon(Icons.arrow_forward_ios,
                                      color: uiHelpers.textPrimaryColor),
                                  tileColor: uiHelpers.surfaceColor,
                                  onTap: () => model.navigationMode(
                                      model.githubApiList[index]),
                                  title: Text(
                                    model.githubApiList[index].path,
                                    style: uiHelpers.title,
                                  )),
                            ),
                        primary: false,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: model.githubApiList.length),
              ],
            ),
          ),
        ),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Source Codes",
              style: uiHelpers.headline,
            ),
            leading: IconButton(
                onPressed: () => model.navigateBack(),
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ))),
      ),
    );
  }
}
