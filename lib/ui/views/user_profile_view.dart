import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/viewmodels/userprofile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UserProfileViewModel>.withConsumer(
        viewModel: UserProfileViewModel(),
        builder: (context, model, child) => Scaffold());
  }
}
