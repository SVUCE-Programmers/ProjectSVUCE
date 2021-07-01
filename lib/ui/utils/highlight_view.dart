import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:markdown_widget/config/style_config.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:markdown_widget/config/highlight_themes.dart' as theme;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';

class HightLightViewWidget extends HookWidget {
  final String data;
  final String title;

  const HightLightViewWidget(
      {Key key, @required this.data, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HighlightViewModel>(
      viewModel: HighlightViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
          appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () => model.changeIndex(),
                    icon: Icon(FlutterIcons.theme_light_dark_mco,
                        color: uiHelpers.textPrimaryColor))
              ],
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
          body: Container(
            height: uiHelpers.height,
            child: MarkdownWidget(
              shrinkWrap: false,
              data: "```\n" + data + "\n```",
              styleConfig: StyleConfig(
                  markdownTheme: model.allThemes.values.elementAt(model.index),
                  preConfig: PreConfig(
                      theme: model.allThemes.keys.elementAt(model.index))),
            ),
          )),
    );
  }
}

class HighlightViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  int index = 0;
  changeIndex() {
    index = (index + 1) % allThemes.length;
    notifyListeners();
  }

  final allThemes = {
    theme.atomOneDarkReasonableTheme: MarkdownTheme.darkTheme,
    theme.a11yLightTheme: MarkdownTheme.lightTheme,
  };

  //?Navigation Functions
  navigateBack() {
    _navigationService.back();
  }
}
