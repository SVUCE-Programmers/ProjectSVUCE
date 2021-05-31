import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view_model.dart';

class ResourceViewer extends StatelessWidget {
  final String data;

  const ResourceViewer({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<GithubPageViewModel>(
      viewModel: GithubPageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "",
              style: uiHelpers.headline,
            ),
            leading: IconButton(
                onPressed: () => model.navigateBack(),
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ))),
        body: Text("$data"),
      ),
    );
  }
}
