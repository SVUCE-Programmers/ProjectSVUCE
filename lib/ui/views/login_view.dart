import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModel: LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: RaisedButton(
                  child: Text("Go to Home"),
                  onPressed: () {
                    model.login(success: true);
                  },
                ),
              ),
            ));
  }
}
