import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/viewmodels/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  final rollNoController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
        viewModel: SignUpViewModel(),
        builder: (context, model, child) => Scaffold(
              body: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  TextField(
                    controller: rollNoController,
                    keyboardType: TextInputType.phone,
                    maxLength: 8,
                    decoration: InputDecoration(
                      labelText: 'Roll No.',
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    maxLength: 12,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  RaisedButton(
                      child: model.busy
                          ? CircularProgressIndicator()
                          : Text("Submit"),
                      onPressed: () {
                        model.createStudent(
                            rollno: rollNoController.text,
                            password: passwordController.text);
                      })
                ],
              ),
            ));
  }
}
