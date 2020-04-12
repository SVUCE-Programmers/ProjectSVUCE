import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.getCurrentUserDetails(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: model.onWillPop,
              child: Scaffold(
                bottomNavigationBar: RaisedButton(
                  child: Text("Logout"),
                  onPressed: model.signOut,
                ),
                body: Center(child: Text(model.currentUser.fullName)),
              ),
            ));
  }
}
