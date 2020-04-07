import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/viewmodels/select_user_viewmodel.dart';

class SelectUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SelectUserViewModel>.withConsumer(
        viewModel: SelectUserViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: RaisedButton(
                  child: Text("Go to Home"),
                  onPressed: () {},
                ),
              ),
            ));
  }
}
