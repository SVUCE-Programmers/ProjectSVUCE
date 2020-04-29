import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/widgets/club_list_item.dart';
import 'package:svuce_app/viewmodels/clublist_viewmodel.dart';

class ClubListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ClubListViewModel>.withConsumer(
        viewModel: ClubListViewModel(),
        onModelReady: (model) => model.getClubListOnce(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: model.onWillPop,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    "Explore Clubs",
                    style: Theme.of(context).textTheme.headline.copyWith(
                        color: textPrimary, fontWeight: FontWeight.bold),
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
                            isBusy: model.busy,
                            success: model.flags[index],
                            club: model.clubs[index],
                            onFollowButtonPressed: () async {
                              await model.followClub(index).then((value) {});
                            },
                          );
                        },
                      ),
                bottomNavigationBar: Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: revampMajor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: FlatButton(
                      onPressed: model.gotoHome, child: Text("Continue")),
                ),
              ),
            ));
  }
}
