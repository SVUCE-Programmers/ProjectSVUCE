import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:markdown_widget/config/style_config.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:markdown_widget/config/highlight_themes.dart' as theme;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';

class HightLightViewWidget extends StatelessWidget {
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
          body: MarkdownWidget(
            data: "```\n" + data + "\n```",
            styleConfig: StyleConfig(
                markdownTheme: model.allThemes.values.elementAt(model.index),
                preConfig: PreConfig(
                    theme: model.allThemes.keys.elementAt(model.index))),
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
    theme.a11yDarkTheme: MarkdownTheme.darkTheme,
    theme.a11yLightTheme: MarkdownTheme.lightTheme,
    theme.agateTheme: MarkdownTheme.lightTheme,
    theme.anOldHopeTheme: MarkdownTheme.lightTheme,
    theme.androidstudioTheme: MarkdownTheme.lightTheme,
    theme.arduinoLightTheme: MarkdownTheme.lightTheme,
    theme.artaTheme: MarkdownTheme.lightTheme,
    theme.asceticTheme: MarkdownTheme.lightTheme,
    theme.atelierCaveDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierCaveLightTheme: MarkdownTheme.lightTheme,
    theme.atelierDuneDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierDuneLightTheme: MarkdownTheme.lightTheme,
    theme.atelierEstuaryDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierEstuaryLightTheme: MarkdownTheme.lightTheme,
    theme.atelierForestDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierForestLightTheme: MarkdownTheme.lightTheme,
    theme.atelierHeathDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierHeathLightTheme: MarkdownTheme.lightTheme,
    theme.atelierLakesideDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierLakesideLightTheme: MarkdownTheme.lightTheme,
    theme.atelierPlateauDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierPlateauLightTheme: MarkdownTheme.lightTheme,
    theme.atelierSavannaDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierSavannaLightTheme: MarkdownTheme.lightTheme,
    theme.atelierSeasideDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierSeasideLightTheme: MarkdownTheme.lightTheme,
    theme.atelierSulphurpoolDarkTheme: MarkdownTheme.lightTheme,
    theme.atelierSulphurpoolLightTheme: MarkdownTheme.lightTheme,
    theme.atomOneDarkReasonableTheme: MarkdownTheme.lightTheme,
    theme.atomOneDarkTheme: MarkdownTheme.lightTheme,
    theme.atomOneLightTheme: MarkdownTheme.lightTheme,
    theme.brownPaperTheme: MarkdownTheme.lightTheme,
    theme.codepenEmbedTheme: MarkdownTheme.lightTheme,
    theme.colorBrewerTheme: MarkdownTheme.lightTheme,
    theme.darculaTheme: MarkdownTheme.lightTheme,
    theme.darkTheme: MarkdownTheme.lightTheme,
    theme.defaultTheme: MarkdownTheme.lightTheme,
    theme.doccoTheme: MarkdownTheme.lightTheme,
    theme.draculaTheme: MarkdownTheme.lightTheme,
    theme.farTheme: MarkdownTheme.lightTheme,
    theme.foundationTheme: MarkdownTheme.lightTheme,
    theme.githubGistTheme: MarkdownTheme.lightTheme,
    theme.githubTheme: MarkdownTheme.lightTheme,
    theme.gmlTheme: MarkdownTheme.lightTheme,
    theme.googlecodeTheme: MarkdownTheme.lightTheme,
    theme.gradientDarkTheme: MarkdownTheme.lightTheme,
    theme.grayscaleTheme: MarkdownTheme.lightTheme,
    theme.gruvboxDarkTheme: MarkdownTheme.lightTheme,
    theme.gruvboxLightTheme: MarkdownTheme.lightTheme,
    theme.hopscotchTheme: MarkdownTheme.lightTheme,
    theme.hybridTheme: MarkdownTheme.lightTheme,
    theme.ideaTheme: MarkdownTheme.lightTheme,
    theme.irBlackTheme: MarkdownTheme.lightTheme,
    theme.isblEditorDarkTheme: MarkdownTheme.lightTheme,
    theme.isblEditorLightTheme: MarkdownTheme.lightTheme,
    theme.kimbieDarkTheme: MarkdownTheme.lightTheme,
    theme.kimbieLightTheme: MarkdownTheme.lightTheme,
    theme.lightfairTheme: MarkdownTheme.lightTheme,
    theme.magulaTheme: MarkdownTheme.lightTheme,
    theme.monoBlueTheme: MarkdownTheme.lightTheme,
    theme.monokaiSublimeTheme: MarkdownTheme.lightTheme,
    theme.nightOwlTheme: MarkdownTheme.lightTheme,
    theme.nordTheme: MarkdownTheme.lightTheme,
    theme.obsidianTheme: MarkdownTheme.lightTheme,
    theme.oceanTheme: MarkdownTheme.lightTheme,
    theme.paraisoDarkTheme: MarkdownTheme.lightTheme,
    theme.paraisoLightTheme: MarkdownTheme.lightTheme,
    theme.pojoaqueTheme: MarkdownTheme.lightTheme,
    theme.purebasicTheme: MarkdownTheme.lightTheme,
    theme.qtcreatorDarkTheme: MarkdownTheme.lightTheme,
    theme.qtcreatorLightTheme: MarkdownTheme.lightTheme,
    theme.railscastsTheme: MarkdownTheme.lightTheme,
    theme.rainbowTheme: MarkdownTheme.lightTheme,
    theme.routerosTheme: MarkdownTheme.lightTheme,
    theme.schoolBookTheme: MarkdownTheme.lightTheme,
    theme.shadesOfPurpleTheme: MarkdownTheme.lightTheme,
    theme.solarizedDarkTheme: MarkdownTheme.lightTheme,
    theme.solarizedLightTheme: MarkdownTheme.lightTheme,
    theme.sunburstTheme: MarkdownTheme.lightTheme,
    theme.tomorrowNightBlueTheme: MarkdownTheme.lightTheme,
    theme.tomorrowNightBrightTheme: MarkdownTheme.lightTheme,
    theme.tomorrowNightEightiesTheme: MarkdownTheme.lightTheme,
    theme.tomorrowNightTheme: MarkdownTheme.lightTheme,
    theme.tomorrowTheme: MarkdownTheme.lightTheme,
    theme.vsTheme: MarkdownTheme.lightTheme,
    theme.vs2015Theme: MarkdownTheme.lightTheme,
    theme.xcodeTheme: MarkdownTheme.lightTheme,
    theme.xt256Theme: MarkdownTheme.lightTheme,
    theme.zenburnTheme: MarkdownTheme.lightTheme,
  };

  //?Navigation Functions
  navigateBack() {
    _navigationService.back();
  }
}
