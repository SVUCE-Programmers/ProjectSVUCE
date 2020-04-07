import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/viewmodels/create_profile_viewmodel.dart';

class CreateProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateProfileViewModel>.withConsumer(
        viewModel: CreateProfileViewModel(),
        builder: (context, model, child) => Scaffold());
  }
}
