import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';

import 'consumers/club_tile.dart';
import 'select_clubs_viewmodel.dart';

class SelectClubsView extends StatelessWidget {
  final bool isSelectClubs;

  const SelectClubsView({Key key, this.isSelectClubs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<SelectClubsViewModel>(
      viewModel: SelectClubsViewModel(),
      onModelReady: (model) => model.init(isSelectClubs),
      builder: (context, uiHelpers, model) {
        return WillPopScope(
          onWillPop: isSelectClubs ? model.showExitSnackbar : null,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: isSelectClubs
                  ? SizedBox()
                  : IconButton(
                      icon: Icon(backIcon, color: uiHelpers.textPrimaryColor),
                      onPressed: model.navigateBack),
              title: Text(
                isSelectClubs ? "Select Clubs" : "Explore Clubs",
                style: uiHelpers.headline
                    .copyWith(color: uiHelpers.textPrimaryColor),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: model.clubs == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: model.clubs.length,
                    itemBuilder: (context, index) {
                      return ClubTile(
                        index: index,
                        headline: uiHelpers.title,
                        body: uiHelpers.body,
                        isSelectClubs: isSelectClubs,
                      );
                    },
                  ),
            bottomNavigationBar: isSelectClubs
                ? Container(
                    margin: EdgeInsets.all(20.0),
                    height: 50,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: uiHelpers.primaryColor, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: model.gotoHome,
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: uiHelpers.primaryColor, fontSize: 16),
                          ),
                        )),
                  )
                : null,
          ),
        );
      },
    );
  }
}
