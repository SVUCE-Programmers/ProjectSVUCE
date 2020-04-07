import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/viewmodels/notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NotificationsViewModel>.withConsumer(
        viewModel: NotificationsViewModel(),
        builder: (context, model, child) => Scaffold());
  }
}
