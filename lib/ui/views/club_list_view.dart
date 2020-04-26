import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/widgets/club_list_item.dart';
import 'package:svuce_app/viewmodels/clublist_viewmodel.dart';

class ClubListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ClubListViewModel>.withConsumer(
        viewModel: ClubListViewModel(),
        onModelReady: (model) => model.getClubListOnce(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text("Explore Clubs"),
              ),
              body: model.clubs == null
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      padding: EdgeInsets.all(20.0),
                      itemCount: model.clubs.length,
                      itemBuilder: (context, index) {
                        return ClubTile(
                          club: model.clubs[index],
                          onFollowButtonPressed: () async {
                            model.followClub(model.clubs[index].id);
                          },
                        );
                      },
                    ),
            ));
  }
}
